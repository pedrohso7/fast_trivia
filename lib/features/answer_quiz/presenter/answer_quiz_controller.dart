import 'package:fast_trivia/core/constants/constants.dart';
import 'package:fast_trivia/core/errors/local_storage_exception.dart';
import 'package:fast_trivia/core/mixins/loading_mixin.dart';
import 'package:fast_trivia/core/usecases/usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../domain/entities/alternative.dart';
import '../domain/entities/answered_quiz.dart';
import '../domain/entities/question.dart';
import '../domain/entities/quiz.dart';

class AnswerQuizController extends GetxController with LoaderMixin {
  late final Quiz quiz;
  final RxString title = ''.obs;
  final RxString question = ''.obs;
  final RxList<Alternative> alternatives = <Alternative>[].obs;
  final RxInt currentQuestion = 0.obs;
  final RxInt selectedAlternative = AppConstants.unselectedValue.obs;
  late final List<int> selectedAlternativesIds;
  final RxList answeredQuestions = [].obs;
  final RxInt correctAnswersCount = 0.obs;

  final UseCase<Future<Quiz>, NoParams> _getQuiz;
  final PageController pageController = PageController();

  AnswerQuizController({
    required UseCase<Future<Quiz>, NoParams> getQuiz,
  }) : _getQuiz = getQuiz;

  @override
  void onReady() {
    super.onReady();
    handleInitialData();
  }

  Future<void> handleInitialData() async {
    try {
      await getQuiz();
      getStateValuesFromQuiz();
      initSelectedAlternativesArray();
    } on LocalStorageException {
      debugPrint('TETE');
    } catch (e) {
      debugPrint('TETE');
    }
  }

  Future<void> getQuiz() async {
    loading.toggle();
    quiz = await _getQuiz.call(NoParams());
    loading.toggle();
  }

  void getStateValuesFromQuiz() {
    title.value = quiz.title;
    question.value = quiz.questions[currentQuestion.value].question;
    alternatives.value = quiz.questions[currentQuestion.value].alternatives;
  }

  void initSelectedAlternativesArray() {
    selectedAlternativesIds = List.generate(
      quiz.questions.length,
      (index) => AppConstants.unselectedValue,
    );
  }

  void onPressBackButton() => Get.back();

  void onPressStartQuiz() => pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceOut,
      );

  void finishQuiz() {
    getAnsweredQuiz();
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceOut,
    );
  }

  void getAnsweredQuiz() {
    // AnsweredQuiz answeredQuiz;
    // answeredQuiz.id = 12;
    // for (int i = 0; i < quiz.questions.length; i++) {}
  }

  void onPressNextQuestion() {
    final bool isFinalQuestion =
        currentQuestion.value == quiz.questions.length - 1;
    if (isFinalQuestion) {
      finishQuiz();
      return;
    }
    final int currentQuestionValue = currentQuestion.value;
    currentQuestion.value = currentQuestionValue + 1;
    getNewStateValues();
  }

  void onPressLastQuestion() {
    final bool isFirstQuestion = currentQuestion.value == 0;
    if (isFirstQuestion) return;
    final int currentQuestionValue = currentQuestion.value;
    currentQuestion.value = currentQuestionValue - 1;
    getNewStateValues();
  }

  void getNewStateValues() {
    final Question selectedQuestion = quiz.questions[currentQuestion.value];
    question.value = selectedQuestion.question;
    alternatives.value = selectedQuestion.alternatives;
  }

  void onPressAlternative(int index) {
    selectedAlternative.value = index;
    final Alternative alternative = alternatives[index];
    selectedAlternativesIds[currentQuestion.value] = alternative.id;
  }
}

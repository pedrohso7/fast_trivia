import 'package:fast_trivia/core/constants/constants.dart';
import 'package:fast_trivia/core/errors/local_storage_exception.dart';
import 'package:fast_trivia/core/mixins/loading_mixin.dart';
import 'package:fast_trivia/core/usecases/usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../domain/entities/alternative.dart';
import '../domain/entities/question.dart';
import '../domain/entities/quiz.dart';
import '../domain/usecases/post_answered_quiz.dart';

class AnswerQuizController extends GetxController with LoaderMixin {
  late final Quiz quiz;
  final PageController pageController = PageController();

  final RxString title = ''.obs;
  final RxString question = ''.obs;
  final RxList<Alternative> alternatives = <Alternative>[].obs;
  final RxList<Question> questions = <Question>[].obs;
  final RxInt currentQuestion = 0.obs;
  final RxInt selectedAlternative = AppConstants.unselectedValue.obs;
  final RxInt correctAnswersCount = 0.obs;
  final RxList<int> selectedAlternatives = <int>[].obs;

  final UseCase<Future<Quiz>, NoParams> _getQuiz;
  final UseCase<Future<String>, PostAnsweredQuizParams> _postAnsweredQuiz;

  AnswerQuizController({
    required UseCase<Future<Quiz>, NoParams> getQuiz,
    required UseCase<Future<String>, PostAnsweredQuizParams> postAnsweredQuiz,
  })  : _getQuiz = getQuiz,
        _postAnsweredQuiz = postAnsweredQuiz;

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
    questions.value = quiz.questions;
  }

  void initSelectedAlternativesArray() {
    selectedAlternatives.value = List.generate(
      quiz.questions.length,
      (index) => AppConstants.unselectedValue,
    );
  }

  void onPressBackButton() => Get.back();

  void onPressStartQuiz() {
    goToAnswerQuizPage();
  }

  void goToAnswerQuizPage() => pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceOut,
      );

  Future<void> finishQuiz() async {
    final PostAnsweredQuizParams postAnsweredQuizParams = handleAnsweredQuiz();
    await _postAnsweredQuiz(postAnsweredQuizParams);
    goToQuizResultPage();
  }

  void goToQuizResultPage() => pageController.animateToPage(
        2,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceOut,
      );

  PostAnsweredQuizParams handleAnsweredQuiz() {
    correctAnswersCount.value = getCorrectAnswersCount();
    final PostAnsweredQuizParams quizData = PostAnsweredQuizParams(
      id: quiz.id,
      title: quiz.title,
      questions: quiz.questions,
      correctAnswersCount: correctAnswersCount.value,
      selectedAlternatives: selectedAlternatives,
    );
    return quizData;
  }

  int getCorrectAnswersCount() {
    int correctAnswersCount = 0;
    for (int i = 0; i < quiz.questions.length; i++) {
      final bool isAnswerCorrect =
          quiz.questions[i].correctAlternativeId == selectedAlternatives[i];
      if (isAnswerCorrect) correctAnswersCount++;
    }
    return correctAnswersCount;
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
    selectedAlternatives[currentQuestion.value] = alternatives[index].id;
  }
}

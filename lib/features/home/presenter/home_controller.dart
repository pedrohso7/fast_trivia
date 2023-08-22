import 'package:fast_trivia/core/errors/local_storage_exception.dart';
import 'package:fast_trivia/core/usecases/usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../domain/entities/answered_quiz.dart';

class HomeController extends GetxController {
  final RxList<AnsweredQuiz> answeredQuizList = <AnsweredQuiz>[].obs;
  final UseCase<Future<List<AnsweredQuiz>>, NoParams> _getAnsweredQuizList;
  HomeController({
    required UseCase<Future<List<AnsweredQuiz>>, NoParams> getAnsweredQuizList,
  }) : _getAnsweredQuizList = getAnsweredQuizList;

  @override
  void onReady() {
    super.onReady();
    getAnsweredQuizList();
  }

  Future<void> getAnsweredQuizList() async {
    answeredQuizList.value = await _getAnsweredQuizList(NoParams());
  }

  Future<void> onPressNewQuizButton() async {
    try {
      Get.toNamed('/answer_quiz');
    } on LocalStorageException {
      debugPrint('TETE');
    } catch (e) {
      debugPrint('TETE');
    }
  }

  Future<void> onPressAnsweredQuiz() async {
    try {
      // Get.toNamed('/answer_quiz');
    } on LocalStorageException {
      debugPrint('TETE');
    } catch (e) {
      debugPrint('TETE');
    }
  }
}

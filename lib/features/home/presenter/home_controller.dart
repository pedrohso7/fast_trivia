import 'package:fast_trivia/core/errors/local_storage_exception.dart';
import 'package:fast_trivia/core/usecases/usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../domain/entities/quiz.dart';

class HomeController extends GetxController {
  final UseCase<Future<Quiz>, NoParams> _getQuiz;
  Quiz? quiz;

  HomeController({
    required UseCase<Future<Quiz>, NoParams> getQuiz,
  }) : _getQuiz = getQuiz;

  Future<void> onPressNewQuizButton() async {
    try {
      quiz = await _getQuiz.call(NoParams());
    } on LocalStorageException {
      debugPrint('TETE');
    } catch (e) {
      debugPrint('TETE');
    }
  }
}

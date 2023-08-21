import 'package:fast_trivia/core/errors/local_storage_exception.dart';
import 'package:fast_trivia/core/mixins/loading_mixin.dart';
import 'package:fast_trivia/core/usecases/usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../domain/entities/quiz.dart';

class AnswerQuizController extends GetxController with LoaderMixin {
  late final Quiz quiz;
  final UseCase<Future<Quiz>, NoParams> _getQuiz;

  AnswerQuizController({
    required UseCase<Future<Quiz>, NoParams> getQuiz,
  }) : _getQuiz = getQuiz;

  @override
  void onReady() {
    super.onReady();
    getQuiz();
  }

  Future<void> getQuiz() async {
    try {
      loading.toggle();
      quiz = await _getQuiz.call(NoParams());
      loading.toggle();
    } on LocalStorageException {
      debugPrint('TETE');
    } catch (e) {
      debugPrint('TETE');
    }
  }

  void onPressBackButton() => Get.back();
}

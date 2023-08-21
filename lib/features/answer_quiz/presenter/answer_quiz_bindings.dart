import 'package:fast_trivia/core/usecases/usecase.dart';
import 'package:get/get.dart';

import '../data/datasources/answer_quiz_local_datasource.dart';
import '../data/repositories/answer_quiz_repository.dart';
import '../domain/entities/quiz.dart';
import '../domain/repositories/answer_quiz_repository_interface.dart';
import '../domain/usecases/get_quiz.dart';
import 'answer_quiz_controller.dart';

class AnswerQuizBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnswerQuizLocalDataSourceInterface>(
      () => AnswerQuizLocalDataSource(
        getStorage: Get.find(),
      ),
    );

    Get.lazyPut<AnswerQuizRepositoryInterface>(
      () => AnswerQuizRepository(
        localDataSource: Get.find(),
      ),
    );

    Get.lazyPut<UseCase<Future<Quiz>, NoParams>>(
      () => GetQuiz(
        Get.find(),
      ),
    );

    Get.lazyPut(
      () => AnswerQuizController(getQuiz: Get.find()),
    );
  }
}
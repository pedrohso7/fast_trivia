import 'package:fast_trivia/core/usecases/usecase.dart';
import 'package:get/get.dart';

import '../data/datasources/home_remote_datasource.dart';
import '../data/repositories/home_repository.dart';
import '../domain/entities/answered_quiz.dart';
import '../domain/repositories/home_repository_interface.dart';
import '../domain/usecases/get_answered_quiz_list.dart';
import 'home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRemoteDataSourceInterface>(
      () => HomeLocalDataSource(),
    );

    Get.lazyPut<HomeRepositoryInterface>(
      () => HomeRepository(
        localDataSource: Get.find(),
      ),
    );

    Get.lazyPut<UseCase<Future<List<AnsweredQuiz>>, NoParams>>(
      () => GetAnsweredQuizList(
        Get.find(),
      ),
    );

    Get.lazyPut(
      () => HomeController(
        getAnsweredQuizList: Get.find(),
      ),
    );
  }
}

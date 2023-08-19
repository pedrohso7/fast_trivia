import 'package:fast_trivia/core/usecases/usecase.dart';
import 'package:fast_trivia/features/home/domain/entities/quiz.dart';
import 'package:fast_trivia/features/home/domain/usecases/get_quiz.dart';
import 'package:get/get.dart';

import '../data/datasources/home_local_datasource.dart';
import '../data/repositories/home_repository.dart';
import '../domain/repositories/home_repository_interface.dart';
import 'home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeLocalDataSourceInterface>(
      () => HomeLocalDataSource(
        getStorage: Get.find(),
      ),
    );

    Get.lazyPut<HomeRepositoryInterface>(
      () => HomeRepository(
        localDataSource: Get.find(),
      ),
    );

    Get.lazyPut<UseCase<Future<Quiz>, NoParams>>(
      () => GetQuiz(
        Get.find(),
      ),
    );

    Get.lazyPut(
      () => HomeController(
        getQuiz: Get.find(),
      ),
    );
  }
}

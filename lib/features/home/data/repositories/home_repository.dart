import 'package:fast_trivia/core/errors/local_storage_exception.dart';
import 'package:fast_trivia/core/result/result.dart';
import '../../domain/entities/quiz.dart';
import '../../domain/repositories/home_repository_interface.dart';
import '../datasources/home_local_datasource.dart';

class HomeRepository implements HomeRepositoryInterface {
  final HomeLocalDataSourceInterface localDataSource;

  HomeRepository({
    required this.localDataSource,
  });

  @override
  Future<IResult<Quiz>> getQuiz() async {
    try {
      return SuccessResult(await localDataSource.getQuiz());
    } on LocalStorageException catch (e) {
      return ErrorResult(e);
    }
  }
}

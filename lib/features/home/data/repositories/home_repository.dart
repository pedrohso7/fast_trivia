import 'package:fast_trivia/core/errors/local_storage_exception.dart';
import 'package:fast_trivia/core/result/result.dart';
import '../../domain/entities/answered_quiz.dart';
import '../../domain/repositories/home_repository_interface.dart';
import '../datasources/home_remote_datasource.dart';

class HomeRepository implements HomeRepositoryInterface {
  final HomeRemoteDataSourceInterface localDataSource;

  HomeRepository({
    required this.localDataSource,
  });

  @override
  Future<IResult<List<AnsweredQuiz>>> getAnsweredQuizList() async {
    try {
      return SuccessResult(await localDataSource.getAnsweredQuizList());
    } on LocalStorageException catch (e) {
      return ErrorResult(e);
    }
  }
}

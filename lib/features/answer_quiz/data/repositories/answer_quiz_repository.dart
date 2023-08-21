import 'package:fast_trivia/core/errors/local_storage_exception.dart';
import 'package:fast_trivia/core/result/result.dart';
import '../../domain/entities/quiz.dart';
import '../../domain/repositories/answer_quiz_repository_interface.dart';
import '../datasources/answer_quiz_local_datasource.dart';

class AnswerQuizRepository implements AnswerQuizRepositoryInterface {
  final AnswerQuizLocalDataSourceInterface localDataSource;

  AnswerQuizRepository({
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

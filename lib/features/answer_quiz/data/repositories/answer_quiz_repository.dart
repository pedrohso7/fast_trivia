import 'package:fast_trivia/core/errors/local_storage_exception.dart';
import 'package:fast_trivia/core/result/result.dart';
import '../../domain/entities/answered_quiz.dart';
import '../../domain/entities/quiz.dart';
import '../../domain/repositories/answer_quiz_repository_interface.dart';
import '../../domain/usecases/post_answered_quiz.dart';
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

  @override
  Future<IResult<AnsweredQuiz>> postAnsweredQuiz(
      PostAnsweredQuizParams params) async {
    try {
      final AnsweredQuiz answeredQuiz =
          await localDataSource.postAnsweredQuiz(params);
      return SuccessResult(answeredQuiz);
    } on LocalStorageException catch (e) {
      return ErrorResult(e);
    }
  }
}

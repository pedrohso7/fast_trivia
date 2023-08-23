import 'package:fast_trivia/core/result/result.dart';

import '../entities/quiz.dart';
import '../usecases/post_answered_quiz.dart';

abstract class AnswerQuizRepositoryInterface {
  Future<IResult<Quiz>> getQuiz();
  Future<IResult<String>> postAnsweredQuiz(PostAnsweredQuizParams params);
}

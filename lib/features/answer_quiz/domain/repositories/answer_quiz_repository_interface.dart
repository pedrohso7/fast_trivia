import 'package:fast_trivia/core/result/result.dart';

import '../entities/quiz.dart';

abstract class AnswerQuizRepositoryInterface {
  Future<IResult<Quiz>> getQuiz();
}

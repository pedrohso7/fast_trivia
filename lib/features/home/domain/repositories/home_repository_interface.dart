import 'package:fast_trivia/core/result/result.dart';

import '../entities/answered_quiz.dart';

abstract class HomeRepositoryInterface {
  Future<IResult<List<AnsweredQuiz>>> getAnsweredQuizList();
}

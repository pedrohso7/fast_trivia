import 'package:fast_trivia/core/result/result.dart';
import 'package:fast_trivia/core/usecases/usecase.dart';

import '../entities/quiz.dart';
import '../repositories/answer_quiz_repository_interface.dart';

class GetQuiz implements UseCase<Future<Quiz>, NoParams> {
  final AnswerQuizRepositoryInterface answerQuizRepository;
  GetQuiz(this.answerQuizRepository);

  @override
  Future<Quiz> call(NoParams params) async {
    final IResult response = await answerQuizRepository.getQuiz();

    if (response.isError) {
      throw response.error!;
    }

    return response.result;
  }
}

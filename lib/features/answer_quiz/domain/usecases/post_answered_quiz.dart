import 'package:fast_trivia/core/result/result.dart';
import 'package:fast_trivia/core/usecases/usecase.dart';

import '../entities/answered_quiz.dart';
import '../entities/question.dart';
import '../repositories/answer_quiz_repository_interface.dart';

class PostAnsweredQuiz
    implements UseCase<Future<AnsweredQuiz>, PostAnsweredQuizParams> {
  final AnswerQuizRepositoryInterface answerQuizRepository;
  PostAnsweredQuiz(this.answerQuizRepository);

  @override
  Future<AnsweredQuiz> call(PostAnsweredQuizParams params) async {
    final IResult response =
        await answerQuizRepository.postAnsweredQuiz(params);

    if (response.isError) {
      throw response.error!;
    }

    return response.result;
  }
}

class PostAnsweredQuizParams {
  final int id;
  final String title;
  final List<Question> questions;
  final int correctAnswersCount;
  final List<int> selectedAlternatives;

  PostAnsweredQuizParams({
    required this.id,
    required this.title,
    required this.correctAnswersCount,
    required this.questions,
    required this.selectedAlternatives,
  });
}

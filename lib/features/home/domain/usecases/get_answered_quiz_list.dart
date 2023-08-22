import 'package:fast_trivia/core/result/result.dart';
import 'package:fast_trivia/core/usecases/usecase.dart';

import '../entities/answered_quiz.dart';
import '../repositories/home_repository_interface.dart';

class GetAnsweredQuizList
    implements UseCase<Future<List<AnsweredQuiz>>, NoParams> {
  final HomeRepositoryInterface homeRepository;
  GetAnsweredQuizList(this.homeRepository);

  @override
  Future<List<AnsweredQuiz>> call(NoParams params) async {
    final IResult response = await homeRepository.getAnsweredQuizList();

    if (response.isError) {
      throw response.error!;
    }

    return response.result;
  }
}

import 'package:fast_trivia/core/result/result.dart';
import 'package:fast_trivia/core/usecases/usecase.dart';

import '../entities/quiz.dart';
import '../repositories/home_repository_interface.dart';

class GetQuiz implements UseCase<Future<Quiz>, NoParams> {
  final HomeRepositoryInterface homeRepository;
  GetQuiz(this.homeRepository);

  @override
  Future<Quiz> call(NoParams params) async {
    final IResult response = await homeRepository.getQuiz();

    if (response.isError) {
      throw response.error!;
    }

    return response.result;
  }
}

import 'question.dart';
import 'quiz.dart';

abstract class AnsweredQuiz extends Quiz {
  final int correctAnswersCount;
  final List<int> selectedAlternatives;
  AnsweredQuiz(
    int id,
    String title,
    List<Question> questions,
    this.correctAnswersCount,
    this.selectedAlternatives,
  ) : super(id, title, questions);
}

import 'question.dart';

abstract class Quiz {
  final int id;
  final String title;
  final List<Question> questions;

  Quiz(
    this.id,
    this.title,
    this.questions,
  );
}

import 'alternative.dart';

abstract class Question {
  final int id;
  final String title;
  final String question;
  final int correctAlternativeId;
  final List<Alternative> alternatives;

  Question(
    this.id,
    this.title,
    this.question,
    this.correctAlternativeId,
    this.alternatives,
  );
}

import 'dart:convert';
import '../../domain/entities/question.dart';
import '../../domain/entities/quiz.dart';
import 'question_model.dart';

class QuizModel extends Quiz {
  QuizModel(
    int id,
    String title,
    List<Question> questions,
  ) : super(id, title, questions);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': title,
      "questoes": questions,
    };
  }

  factory QuizModel.fromMap(Map map) {
    final List<Question> questions = map['questoes']
        .map<Question>((question) => QuestionModel.fromMap(question))
        .toList();
    return QuizModel(
      map['id'],
      map['titulo'],
      questions,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}

import 'dart:convert';
import '../../domain/entities/answered_quiz.dart';
import '../../domain/entities/question.dart';
import 'question_model.dart';

class AnsweredQuizModel extends AnsweredQuiz {
  AnsweredQuizModel(
    int id,
    String title,
    List<Question> questions,
    int correctAnswersCount,
    List<int> selectedAlternatives,
  ) : super(id, title, questions, correctAnswersCount, selectedAlternatives);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': title,
      'questoes': questions,
      'coontagemRespostasCorretas': correctAnswersCount,
      'alternativasSelecionadas': selectedAlternatives
    };
  }

  factory AnsweredQuizModel.fromMap(Map map) {
    final List<Question> questions = map['questoes']
        .map<Question>((question) => QuestionModel.fromMap(question))
        .toList();
    return AnsweredQuizModel(
      map['id'],
      map['title'],
      questions,
      map['correctAnswersCount'],
      map['selectedAlternatives'],
    );
  }

  factory AnsweredQuizModel.fromObject(dynamic object) {
    return AnsweredQuizModel(
      object.id,
      object.title,
      object.questions,
      object.correctAnswersCount,
      object.selectedAlternatives,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnsweredQuizModel.fromJson(String source) =>
      AnsweredQuizModel.fromMap(json.decode(source));
}

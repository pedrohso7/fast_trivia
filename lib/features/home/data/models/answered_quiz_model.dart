import 'dart:convert';
import 'package:fast_trivia/core/constants/constants.dart';

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
    final List<Question> questions = map['questoes'].map<Question>((question) {
      return QuestionModel.fromMap(question);
    }).toList();

    final List<int> respostasSelecionadas =
        map['respostasEscolhidas'].map<int>((item) => item as int).toList();
    return AnsweredQuizModel(
      map['id'] ?? AppConstants.uselessValue,
      map['titulo'],
      questions,
      map['respostasCorretas'],
      respostasSelecionadas,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnsweredQuizModel.fromJson(String source) =>
      AnsweredQuizModel.fromMap(json.decode(source));
}

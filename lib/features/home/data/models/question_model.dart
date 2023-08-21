import 'dart:convert';
import '../../domain/entities/alternative.dart';
import '../../domain/entities/question.dart';
import 'alternative_model.dart';

class QuestionModel extends Question {
  QuestionModel(
    int id,
    String title,
    String question,
    int correctAlternativeId,
    List<Alternative> alternatives,
  ) : super(
          id,
          title,
          question,
          correctAlternativeId,
          alternatives,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': title,
      "pergunta": question,
      "gabarito": correctAlternativeId,
      "alternativas": alternatives,
    };
  }

  factory QuestionModel.fromMap(Map map) {
    final List<Alternative> alternatives = map['alternativas']
        .map<Alternative>(
            (alternative) => AlternativeModel.fromMap(alternative))
        .toList();
    return QuestionModel(
      map['id'],
      map['titulo'],
      map['pergunta'],
      map['gabarito'],
      alternatives,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));
}

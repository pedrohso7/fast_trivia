import 'dart:convert';
import 'package:fast_trivia/core/constants/constants.dart';

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
    final List<Alternative> items = map['alternativas'].map<Alternative>(
      (alternative) {
        return AlternativeModel.fromMap(alternative);
      },
    ).toList();
    return QuestionModel(
      map['id'] ?? AppConstants.uselessValue,
      map['titulo'],
      map['pergunta'],
      map['gabarito'],
      items,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));
}

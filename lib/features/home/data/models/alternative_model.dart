import 'dart:convert';
import '../../domain/entities/alternative.dart';

class AlternativeModel extends Alternative {
  AlternativeModel(
    int id,
    String title,
  ) : super(id, title);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': title,
    };
  }

  factory AlternativeModel.fromMap(Map map) {
    return AlternativeModel(
      map['id'],
      map['titulo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AlternativeModel.fromJson(String source) =>
      AlternativeModel.fromMap(json.decode(source));
}

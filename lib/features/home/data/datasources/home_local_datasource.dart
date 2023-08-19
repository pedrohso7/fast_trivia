import 'dart:convert';

import 'package:fast_trivia/core/constants/json_archives_path.dart';
import 'package:fast_trivia/core/errors/local_storage_exception.dart';
import 'package:fast_trivia/features/home/data/models/quiz_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get_storage/get_storage.dart';

import '../../domain/entities/quiz.dart';

abstract class HomeLocalDataSourceInterface {
  Future<Quiz> getQuiz();
}

class HomeLocalDataSource implements HomeLocalDataSourceInterface {
  final GetStorage getStorage;

  HomeLocalDataSource({required this.getStorage});

  @override
  Future<Quiz> getQuiz() async {
    try {
      final String jsonString = await rootBundle.loadString(AppJson.quizJson);
      return QuizModel.fromMap(json.decode(jsonString)['questionario']);
    } on LocalStorageException catch (e) {
      throw LocalStorageException(message: e.message);
    }
  }
}

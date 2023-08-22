import 'dart:convert';
import 'package:fast_trivia/core/constants/json_archives_path.dart';
import 'package:fast_trivia/core/errors/local_storage_exception.dart';
import 'package:fast_trivia/features/answer_quiz/data/models/answered_quiz_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get_storage/get_storage.dart';

import '../../domain/entities/answered_quiz.dart';
import '../../domain/entities/quiz.dart';
import '../../domain/usecases/post_answered_quiz.dart';
import '../models/quiz_model.dart';

abstract class AnswerQuizLocalDataSourceInterface {
  Future<Quiz> getQuiz();
  Future<AnsweredQuiz> postAnsweredQuiz(PostAnsweredQuizParams params);
}

class AnswerQuizLocalDataSource implements AnswerQuizLocalDataSourceInterface {
  final GetStorage getStorage;

  AnswerQuizLocalDataSource({required this.getStorage});

  @override
  Future<Quiz> getQuiz() async {
    try {
      final String jsonString = await rootBundle.loadString(AppJson.quizJson);
      return QuizModel.fromMap(json.decode(jsonString)['questionario']);
    } on LocalStorageException catch (e) {
      throw LocalStorageException(message: e.message);
    }
  }

  @override
  Future<AnsweredQuiz> postAnsweredQuiz(PostAnsweredQuizParams params) async {
    try {
      final AnsweredQuiz answeredQuiz = AnsweredQuizModel.fromObject(params);
      final List<AnsweredQuiz>? answeredQuizArray =
          getStorage.read('answeredQuizArray');

      if (answeredQuizArray != null) {
        answeredQuizArray.add(answeredQuiz);
        return answeredQuiz;
      }

      getStorage.write('answeredQuizArray', <AnsweredQuiz>[answeredQuiz]);

      return answeredQuiz;
    } on LocalStorageException catch (e) {
      throw LocalStorageException(message: e.message);
    }
  }
}

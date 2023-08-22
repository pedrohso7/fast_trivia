import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_trivia/core/errors/remote_client_exception.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/answered_quiz.dart';
import '../models/answered_quiz_model.dart';

abstract class HomeRemoteDataSourceInterface {
  Future<List<AnsweredQuiz>> getAnsweredQuizList();
}

class HomeLocalDataSource implements HomeRemoteDataSourceInterface {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<List<AnsweredQuiz>> getAnsweredQuizList() async {
    try {
      final QuerySnapshot response = await db.collection("answeredQuiz").get();
      final List<AnsweredQuiz> answeredQuizList = response.docs
          .map<AnsweredQuiz>(
            (quiz) => AnsweredQuizModel.fromMap(
              quiz.data() as Map<String, dynamic>,
            ),
          )
          .toList();
      return answeredQuizList;
    } on FirebaseException catch (e) {
      throw RemoteClientException(e.message!);
    } catch (e) {
      throw RemoteClientException('Erro ao buscar questionários respondidos');
    }
  }
}

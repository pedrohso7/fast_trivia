import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_trivia/core/errors/remote_client_exception.dart';
import '../../domain/usecases/post_answered_quiz.dart';

abstract class AnswerQuizRemoteDataSourceInterface {
  Future<String> postAnsweredQuiz(PostAnsweredQuizParams params);
}

class AnswerQuizRemoteDataSource
    implements AnswerQuizRemoteDataSourceInterface {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<String> postAnsweredQuiz(PostAnsweredQuizParams params) async {
    try {
      final DocumentReference<Map<String, dynamic>> response =
          await db.collection("answeredQuiz").add(
        {
          "titulo": params.title,
          "respostasCorretas": params.correctAnswersCount,
          "respostasEscolhidas": params.selectedAlternatives,
          "questoes": params.questions.map(
            (question) => {
              "titulo": question.title,
              "pergunta": question.question,
              "gabarito": question.correctAlternativeId,
              "alternativas": question.alternatives.map(
                (alternative) => {
                  "id": alternative.id,
                  "titulo": alternative.title,
                },
              ),
            },
          ),
        },
      );
      return response.id;
    } on FirebaseException catch (e) {
      throw RemoteClientException(e.message!);
    } catch (e) {
      throw RemoteClientException('sada');
    }
  }
}

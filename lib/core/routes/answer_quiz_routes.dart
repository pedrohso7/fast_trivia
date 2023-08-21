import 'package:fast_trivia/features/answer_quiz/presenter/answer_quiz_bindings.dart';
import 'package:fast_trivia/features/answer_quiz/presenter/answer_quiz_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AnswerQuizRoutes {
  AnswerQuizRoutes._();
  static final routers = <GetPage>[
    GetPage(
      name: '/answer_quiz',
      binding: AnswerQuizBindings(),
      page: () => const AnswerQuizPage(),
    ),
  ];
}

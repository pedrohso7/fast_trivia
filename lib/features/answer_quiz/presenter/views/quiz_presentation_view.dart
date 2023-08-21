import 'package:fast_trivia/core/widgets/default_button.dart';
import 'package:fast_trivia/core/widgets/filled_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../answer_quiz_controller.dart';

class QuizPresentationView extends GetView<AnswerQuizController> {
  const QuizPresentationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledContainer(
      child: Column(
        children: [
          Obx(() {
            return Text(
              controller.title.value,
            );
          }),
          Row(
            children: [
              DefaultButton(
                label: 'Voltar',
                onPressed: controller.onPressBackButton,
              ),
              DefaultButton(
                label: 'responder quiz',
                onPressed: controller.onPressStartQuiz,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

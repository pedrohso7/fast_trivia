import 'package:fast_trivia/core/widgets/filled_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../answer_quiz_controller.dart';
import '../widgets/answer_corretion_detail_item.dart';

class QuizResultView extends GetView<AnswerQuizController> {
  const QuizResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledContainer(
      child: Column(
        children: [
          Text(
            'Resultado:',
            // onPressed: () => controller.onPressNewQuizButton(),
          ),
          Text(
            'Acertos: ${controller.correctAnswersCount.value}',
            // onPressed: () => controller.onPressNewQuizButton(),
          ),
          Text(
            'Detalhes',
            // onPressed: () => controller.onPressNewQuizButton(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.questions.length,
              itemBuilder: (context, index) => AnswerCorrectionDetailItem(
                title: controller.questions[index].title,
                onPressListItem: () => controller.onPressAlternative(index),
                isAnswerCorrect:
                    controller.questions[index].correctAlternativeId ==
                        controller.selectedAlternatives[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

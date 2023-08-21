import 'package:fast_trivia/core/widgets/default_button.dart';
import 'package:fast_trivia/core/widgets/filled_container.dart';
import 'package:fast_trivia/features/answer_quiz/presenter/widgets/alternative_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../answer_quiz_controller.dart';

class QuestionView extends GetView<AnswerQuizController> {
  const QuestionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledContainer(
      child: Column(
        children: [
          Obx(() {
            return Text(
              'Pergunta ${controller.currentQuestion.value}: ${controller.question.value}',
            );
          }),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.alternatives.length,
                itemBuilder: (context, index) => AlternativeListItem(
                  title: controller.alternatives[index].title,
                  onPressListItem: () => controller.onPressAlternative(index),
                ),
              );
            }),
          ),
          Row(
            children: [
              DefaultButton(
                label: 'Anterior',
                onPressed: controller.onPressLastQuestion,
              ),
              DefaultButton(
                label: 'Próxima',
                onPressed: controller.onPressNextQuestion,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

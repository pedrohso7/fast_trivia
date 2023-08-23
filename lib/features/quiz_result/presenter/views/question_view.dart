import 'package:fast_trivia/core/constants/colors.dart';
import 'package:fast_trivia/core/constants/sizes.dart';
import 'package:fast_trivia/core/constants/text_style.dart';
import 'package:fast_trivia/core/widgets/default_button.dart';
import 'package:fast_trivia/core/widgets/filled_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../answer_quiz_controller.dart';
import '../widgets/alternative_list_item.dart';

class QuestionView extends GetView<QuizResultController> {
  const QuestionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.s16,
          horizontal: AppSizes.s24,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.emoji_objects,
                      color: AppColors.yellow,
                    ),
                    const SizedBox(width: AppSizes.s4),
                    Obx(() {
                      return Text(
                        'Pergunta ${controller.currentQuestion.value + 1}/ ${controller.questions.length}',
                        style: AppTextStyles.defaultYellowText,
                      );
                    }),
                  ],
                ),
                const SizedBox(height: AppSizes.s24),
                Obx(() {
                  return Text(
                    controller.question.value,
                    style: AppTextStyles.subTitle,
                  );
                }),
                const SizedBox(height: AppSizes.s32),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.alternatives.length,
                    itemBuilder: (context, index) => Obx(() {
                      return AlternativeListItem(
                        alternativeNumber: index + 1,
                        isSelected:
                            index == controller.selectedAlternative.value,
                        title: controller.alternatives[index].title,
                        onPressListItem: () =>
                            controller.onPressAlternative(index),
                      );
                    }),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(bottom: AppFontSizes.s24),
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    return Visibility(
                      visible: controller.currentQuestion.value != 0,
                      child: DefaultButton(
                        height: AppSizes.s80,
                        width: AppSizes.s80,
                        borderRadius: AppSizes.s80,
                        onPressed: controller.onPressLastQuestion,
                        child: const Icon(
                          Icons.arrow_circle_left,
                          color: AppColors.white,
                          size: AppSizes.s40,
                        ),
                      ),
                    );
                  }),
                  Obx(() {
                    return DefaultButton(
                      height: AppSizes.s80,
                      width: AppSizes.s80,
                      borderRadius: AppSizes.s80,
                      onPressed: controller.onPressNextQuestion,
                      child: Icon(
                        (controller.currentQuestion.value + 1 ==
                                controller.questions.length)
                            ? Icons.check_circle_outline_sharp
                            : Icons.arrow_circle_right,
                        color: AppColors.white,
                        size: AppSizes.s40,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

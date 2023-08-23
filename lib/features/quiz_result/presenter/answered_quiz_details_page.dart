import 'package:fast_trivia/core/constants/colors.dart';
import 'package:fast_trivia/core/constants/sizes.dart';
import 'package:fast_trivia/core/constants/text_style.dart';
import 'package:fast_trivia/core/widgets/filled_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './answer_quiz_controller.dart';
import './widgets/answer_corretion_detail_item.dart';

class QuizResultPage extends GetView<QuizResultController> {
  const QuizResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.s16,
          horizontal: AppSizes.s24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Resultado',
                  style: AppTextStyles.title,
                ),
                (0.6 * controller.questions.length <=
                        controller.correctAnswersCount.value)
                    ? const Icon(Icons.check, color: AppColors.successColor)
                    : const Icon(Icons.close, color: AppColors.errorColor),
              ],
            ),
            const SizedBox(
              height: AppSizes.s16,
            ),
            Text('Acertos: ${controller.correctAnswersCount.value}',
                style: AppTextStyles.defaultYellowText),
            const SizedBox(
              height: AppSizes.s16,
            ),
            Text('Tempo gasto: ${controller.correctAnswersCount.value}',
                style: AppTextStyles.defaultYellowText),
            const SizedBox(
              height: AppSizes.s16,
            ),
            const Divider(
              thickness: AppSizes.s2,
              color: AppColors.white,
            ),
            const SizedBox(
              height: AppSizes.s16,
            ),
            const Text('Perguntas:', style: AppTextStyles.subTitle),
            const SizedBox(
              height: AppSizes.s16,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.questions.length,
                itemBuilder: (context, index) => AnswerCorrectionDetailItem(
                  title: controller.questions[index].title,
                  onPressListItem: () => controller.onPressAlternative(index),
                  isCorrect: controller.questions[index].correctAlternativeId ==
                      controller.selectedAlternatives[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

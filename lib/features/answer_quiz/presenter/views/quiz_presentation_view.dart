import 'package:fast_trivia/core/constants/image_path.dart';
import 'package:fast_trivia/core/constants/sizes.dart';
import 'package:fast_trivia/core/constants/text_style.dart';
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
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.s16,
          horizontal: AppSizes.s24,
        ),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  return Text(
                    controller.title.value,
                    style: AppTextStyles.title,
                  );
                }),
                const SizedBox(height: AppSizes.s4),
                Text(
                  '${controller.questions.length + 1} Perguntas',
                  style: AppTextStyles.defaultYellowText,
                ),
              ],
            ),
            const SizedBox(height: AppSizes.s32),
            SizedBox(
              height: AppSizes.s216,
              width: AppSizes.s216,
              child: Image.asset(
                AppImages.triviaImagePath,
                fit: BoxFit.contain,
                // opacity: ,
              ),
            ),
            const SizedBox(height: AppSizes.s40),
            Column(
              children: [
                DefaultButton(
                  width: AppSizes.s184,
                  onPressed: controller.onPressStartQuiz,
                  label: 'Iniciar Quiz',
                ),
                const SizedBox(height: AppSizes.s16),
                DefaultButton(
                  isSecondaryStyle: true,
                  width: AppSizes.s184,
                  onPressed: controller.onPressBackButton,
                  label: "Cancelar",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

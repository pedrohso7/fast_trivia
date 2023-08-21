import 'package:fast_trivia/core/constants/colors.dart';
import 'package:fast_trivia/core/widgets/default_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'answer_quiz_controller.dart';

class AnswerQuizPage extends GetView<AnswerQuizController> {
  const AnswerQuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(onPressBackButton: controller.onPressBackButton),
      backgroundColor: AppColors.infoBackgroundColor,
      body: const Center(
        child: Text(
          'Novo Quiz',
          // onPressed: () => controller.onPressNewQuizButton(),
        ),
      ),
    );
  }
}

import 'package:fast_trivia/core/constants/colors.dart';
import 'package:fast_trivia/core/widgets/default_appbar.dart';
import 'package:fast_trivia/features/answer_quiz/presenter/views/question_view.dart';
import 'package:fast_trivia/features/answer_quiz/presenter/views/quiz_presentation_view.dart';
import 'package:fast_trivia/features/answer_quiz/presenter/views/quiz_result_view.dart';
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
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: const [
            QuizPresentationView(),
            QuestionView(),
            QuizResultView(),
          ],
        ),
      ),
    );
  }
}

import 'package:fast_trivia/core/constants/colors.dart';
import 'package:fast_trivia/core/constants/sizes.dart';
import 'package:fast_trivia/core/constants/text_style.dart';
import 'package:fast_trivia/core/widgets/default_appbar.dart';
import 'package:fast_trivia/core/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';
import 'widgets/answered_quiz_list_item.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppbar(withBackButton: false),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.s16,
          horizontal: AppSizes.s24,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dashboard',
                  style: AppTextStyles.title,
                ),
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
                const Text('Histórico:', style: AppTextStyles.subTitle),
                const SizedBox(
                  height: AppSizes.s16,
                ),
                Expanded(
                  child: Obx(() {
                    return ListView.builder(
                      itemCount: controller.answeredQuizList.length,
                      itemBuilder: (context, index) => AnsweredQuizListItem(
                        correctAnswersCount: controller
                            .answeredQuizList[index].correctAnswersCount,
                        totalAnswersCount:
                            controller.answeredQuizList[index].questions.length,
                        title: controller.answeredQuizList[index].title,
                        onPressListItem: () => controller.onPressAnsweredQuiz(),
                      ),
                    );
                  }),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(bottom: AppFontSizes.s24),
              alignment: Alignment.bottomRight,
              child: DefaultButton(
                height: AppSizes.s80,
                width: AppSizes.s80,
                borderRadius: AppSizes.s80,
                label: '+Quiz',
                onPressed: () => controller.onPressNewQuizButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

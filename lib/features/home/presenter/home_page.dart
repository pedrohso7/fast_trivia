import 'package:fast_trivia/core/constants/colors.dart';
import 'package:fast_trivia/core/widgets/default_appbar.dart';
import 'package:fast_trivia/core/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppbar(),
      backgroundColor: AppColors.infoBackgroundColor,
      body: Center(
        child: DefaultButton(
          label: 'Novo Quiz',
          onPressed: () => controller.onPressNewQuizButton(),
        ),
      ),
    );
  }
}

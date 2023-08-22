import 'package:fast_trivia/core/constants/colors.dart';
import 'package:fast_trivia/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class AnsweredQuizListItem extends StatelessWidget {
  final String title;
  final int correctAnswersCount;
  final int totalAnswersCount;
  final VoidCallback onPressListItem;
  const AnsweredQuizListItem({
    Key? key,
    required this.title,
    required this.correctAnswersCount,
    required this.totalAnswersCount,
    required this.onPressListItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isQuizPassed = 0.6 * totalAnswersCount <= correctAnswersCount;
    return ListTile(
      leading: Icon((isQuizPassed) ? Icons.check : Icons.close),
      iconColor: (isQuizPassed) ? AppColors.successColor : AppColors.errorColor,
      title: Text(
        title,
        style: AppTextStyles.defaultText,
      ),
      onTap: onPressListItem,
      trailing: Text(
        '$correctAnswersCount/$totalAnswersCount',
        style: AppTextStyles.defaultYellowText,
      ),
    );
  }
}

import 'package:fast_trivia/core/constants/colors.dart';
import 'package:fast_trivia/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class AnswerCorrectionDetailItem extends StatelessWidget {
  final String title;
  final bool isCorrect;
  final VoidCallback onPressListItem;
  const AnswerCorrectionDetailItem({
    Key? key,
    required this.title,
    required this.isCorrect,
    required this.onPressListItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon((isCorrect) ? Icons.check : Icons.close),
      iconColor: (isCorrect) ? AppColors.successColor : AppColors.errorColor,
      title: Text(
        title,
        style: AppTextStyles.defaultText,
      ),
      onTap: onPressListItem,
      // trailing: Text(
      //  (isCorrect) ? 'Respondido',
      //   style: AppTextStyles.defaultYellowText,
      // ),
    );
  }
}

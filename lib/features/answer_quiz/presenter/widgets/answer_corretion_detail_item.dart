import 'package:fast_trivia/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AnswerCorrectionDetailItem extends StatelessWidget {
  final String title;
  final bool isAnswerCorrect;
  final VoidCallback onPressListItem;
  const AnswerCorrectionDetailItem({
    Key? key,
    required this.title,
    required this.isAnswerCorrect,
    required this.onPressListItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: AppColors.black),
      ),
      onTap: onPressListItem,
      leading: isAnswerCorrect ? Icon(Icons.check) : Icon(Icons.close),
    );
  }
}

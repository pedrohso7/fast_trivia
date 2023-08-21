import 'package:fast_trivia/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AlternativeListItem extends StatelessWidget {
  final String title;
  final VoidCallback onPressListItem;
  const AlternativeListItem({
    Key? key,
    required this.title,
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
    );
  }
}

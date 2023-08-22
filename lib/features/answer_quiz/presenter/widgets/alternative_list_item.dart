import 'package:fast_trivia/core/constants/colors.dart';
import 'package:fast_trivia/core/constants/text_style.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/sizes.dart';

class AlternativeListItem extends StatelessWidget {
  final String title;
  final int alternativeNumber;
  final VoidCallback onPressListItem;
  final bool isSelected;
  const AlternativeListItem({
    Key? key,
    required this.title,
    required this.alternativeNumber,
    required this.onPressListItem,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.s8),
      child: ListTile(
        shape: RoundedRectangleBorder(
          //<-- SEE HERE
          side: const BorderSide(width: 1, color: AppColors.yellow),
          borderRadius: BorderRadius.circular(AppSizes.s24),
        ),
        selectedColor: AppColors.lightBlack,
        selected: isSelected,
        tileColor: isSelected ? AppColors.lightBlack : AppColors.white,
        title: Text(
          title,
          style: AppTextStyles.defaultBlackText,
          textAlign: TextAlign.center,
        ),
        onTap: onPressListItem,
      ),
    );
  }
}

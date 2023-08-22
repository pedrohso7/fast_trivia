import 'package:fast_trivia/core/constants/colors.dart';
import 'package:fast_trivia/core/constants/text_style.dart';
import 'package:flutter/material.dart';

import '../constants/sizes.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isSecondaryStyle;
  final String label;
  final double? width;
  final double height;
  final double borderRadius;
  final Widget? child;

  const DefaultButton({
    Key? key,
    required this.onPressed,
    this.isSecondaryStyle = false,
    this.label = '',
    this.width,
    this.height = AppSizes.s56,
    this.borderRadius = AppSizes.s4,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          backgroundColor:
              isSecondaryStyle ? AppColors.transparent : AppColors.yellow,
          elevation: isSecondaryStyle ? 0 : null,
        ),
        child: child ??
            Text(
              label,
              style: isSecondaryStyle
                  ? AppTextStyles.defaultYellowText
                  : AppTextStyles.defaultText,
            ),
      ),
    );
  }
}

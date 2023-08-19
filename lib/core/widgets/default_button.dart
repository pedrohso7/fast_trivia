import 'package:fast_trivia/core/constants/colors.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final double? width;
  final double height;
  final Color? color;
  final double fontSize;
  final double borderRadius;
  final bool revertColor;
  final Widget? richText;

  const DefaultButton({
    Key? key,
    required this.onPressed,
    this.label = '',
    this.width,
    this.height = 50,
    this.color,
    this.borderRadius = 5,
    this.fontSize = 14,
    this.revertColor = false,
    this.richText,
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
            side: revertColor
                ? BorderSide(color: color ?? const Color(0xFF016EA7))
                : BorderSide.none,
          ),
          backgroundColor:
              revertColor ? Colors.white : color ?? AppColors.yellow,
        ),
        child: richText ??
            Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: revertColor ? AppColors.yellow : AppColors.white,
              ),
            ),
      ),
    );
  }
}

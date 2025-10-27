import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color; // optional background color
  final double borderRadius;
  final double verticalPadding;
  final Color? textColor;
  final double fontSize;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.borderRadius = 8,
    this.verticalPadding = 15,
    this.textColor,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = (color == AppColors.primary)
        ? AppColors.primary
        : Colors.white;

    final Color effectiveTextColor = (backgroundColor == AppColors.primary)
        ? Colors.white
        : (textColor ?? AppColors.primary);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: const BorderSide(
          color: AppColors.primary,
          // width: 1,
        ),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        // elevation: 2,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: effectiveTextColor, fontSize: fontSize),
      ),
    );
  }
}

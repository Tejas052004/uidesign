import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackButtonWidget extends StatelessWidget {
  final Color iconColor;
  final Color textColor;
  final double fontSize;
  final String? title;

  const BackButtonWidget({
    super.key,
    this.iconColor = Colors.black,
    this.textColor = Colors.black,
    this.fontSize = 16,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 18, color: iconColor),
          onPressed: () {
            Get.back();
          },
        ),
        Text(
          "Back",
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
            fontWeight: FontWeight.w400,
          ),
        ),

        if (title != null) ...[
          const SizedBox(width: 5),
          Text(
            "${title!}",
            style: TextStyle(
              fontSize: fontSize,
              color: textColor.withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }
}

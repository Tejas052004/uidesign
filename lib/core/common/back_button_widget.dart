import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common_text.dart';

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
    return Stack(
      alignment: Alignment.center,
      children: [
        // ✅ Center Title (if available)
        if (title != null)
          CommonText(
            title!,
            textAlign: TextAlign.center,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),

        // ✅ Back button on left
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: Colors.black,
                ),
                const SizedBox(width: 2), // 👈 very small gap (adjust if needed)
                const Text(
                  "Back",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

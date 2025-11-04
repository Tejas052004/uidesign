import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uidesign/core/common/common_text.dart';
import 'package:uidesign/core/common/common_text_field.dart';
import 'package:uidesign/core/common/custom_button.dart';
import 'package:uidesign/core/theme/app_colors.dart';

class CustomDialog extends StatelessWidget {
  // 🔹 Basic fields
  final String? title;
  final String? message;
  final String? imagePath;

  // 🔹 Optional amount
  final String? amount;

  // 🔹 Optional button
  final String? buttonText;
  final VoidCallback? onPressed;

  // 🔹 Optional dropdown
  final List<String>? dropdownItems;
  final String? selectedValue;
  final ValueChanged<String?>? onDropdownChanged;
  final String? hintText;

  // 🔹 Optional text field
  final String? secondHintText;

  const CustomDialog({
    super.key,
     this.title,
     this.message,
     this.imagePath,
    this.amount,
    this.buttonText,
    this.onPressed,
    this.dropdownItems,
    this.selectedValue,
    this.onDropdownChanged,
    this.hintText,
    this.secondHintText,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),

                  // 🖼 Image
                  Image.asset(imagePath!, width: 150, height: 150),
                  const SizedBox(height: 20),

                  // 🏷 Title
                  CommonText(
                    title!,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),

                  // 💬 Message
                  CommonText(
                    message!,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.grey,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // 💰 Optional Amount
                  if (amount != null) ...[
                    CommonText(
                      "Amount",
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    CommonText(
                      amount!,
                      fontWeight: FontWeight.w600,
                      fontSize: 34,
                      textAlign: TextAlign.center,
                    ),
                    const Divider(thickness: 1, color: Colors.grey),
                    const SizedBox(height: 10),
                  ],

                  // 🔽 Optional Dropdown
                  if (dropdownItems != null &&
                      selectedValue != null &&
                      onDropdownChanged != null) ...[
                    CommonTextField(
                      hintText: hintText ?? "Select Option",
                      isDropdownField: true,
                      dropdownItems: dropdownItems!,
                      selectedValue: selectedValue!,
                      onDropdownChanged: onDropdownChanged!,
                    ),
                    const SizedBox(height: 20),
                  ],

                  // 🧾 Optional Text Field
                  if (secondHintText != null) ...[
                    CommonTextField(hintText: secondHintText!),
                    const SizedBox(height: 20),
                  ],

                  // 🔘 Optional Button
                  if (buttonText != null && onPressed != null)
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: buttonText!,
                            onPressed: onPressed!,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),

          // ❌ Close Button
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.grey),
              onPressed: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }
}

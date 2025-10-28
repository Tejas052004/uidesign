import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uidesign/core/common/common_text.dart';
import 'package:uidesign/core/common/common_text_field.dart';
import '../controllers/signup_controller.dart';
import '../core/common/back_button_widget.dart';
import '../core/common/custom_button.dart';
import '../core/common/safe_area_wrapper.dart';
import '../core/theme/app_colors.dart';
import '../routes/app_pages.dart';

class SendVerification extends StatelessWidget {
  SendVerification({super.key});

  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeAreaWrapper(
        scrollable: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 🔙 Back Button
            const Row(
              children: [BackButtonWidget()],
            ),

            const SizedBox(height: 10),

            const CommonText(
              "Verification email or phone number",
              fontSize: 24,
              fontWeight: FontWeight.w500,
              // textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            // 📩 Email or Phone Field
            CommonTextField(hintText: "Email or phone number"),

            const Spacer(),

            // 🔘 Send OTP Button (Fixed Bottom)
            CustomButton(
              text: "Send OTP",
              color: AppColors.primary,
              onPressed: () {
                Get.toNamed(Routes.forgetPassword);
              },
            ),

            const SizedBox(height: 16), // 👇 small bottom padding
          ],
        ),
      ),
    );
  }
}

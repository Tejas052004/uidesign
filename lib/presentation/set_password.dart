import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/password_controller.dart';
import '../core/common/back_button_widget.dart';
import '../core/common/common_text.dart';
import '../core/common/common_text_field.dart';
import '../core/common/custom_button.dart';
import '../core/common/safe_area_wrapper.dart';
import '../core/theme/app_colors.dart';
import '../routes/app_pages.dart';

class SetPassword extends StatelessWidget {
  const SetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final SetNewPasswordController controller = Get.find<SetNewPasswordController>();

    return Scaffold(
      body: SafeAreaWrapper(
        scrollable: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(children: [BackButtonWidget()]),
            const SizedBox(height: 10),
            const CommonText(
              "Set password",
              fontSize: 24,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const CommonText(
              "Set your password",
              fontWeight: FontWeight.w400,
              fontSize: 16,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // 🔑 Password Field
            Obx(
              () => CommonTextField(
                hintText: "Enter Your Password",
                obscureText: controller.isPasswordHidden.value,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isPasswordHidden.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: controller.togglePasswordVisibility,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 🔁 Confirm Password Field
            Obx(
              () => CommonTextField(
                hintText: "Confirm Password",
                obscureText: controller.isConfirmPasswordHidden.value,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isConfirmPasswordHidden.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: controller.toggleConfirmPasswordVisibility,
                ),
              ),
            ),

            const SizedBox(height: 5),
            const CommonText(
              "At least 1 number or a special character",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
              textAlign: TextAlign.left,
            ),

            const Spacer(),

            CustomButton(
              text: "Register",
              color: AppColors.primary,
              onPressed: () => Get.toNamed(Routes.profilePage),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

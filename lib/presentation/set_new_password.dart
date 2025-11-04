import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uidesign/core/common/common_text.dart';
import '../controllers/password_controller.dart';
import '../core/common/back_button_widget.dart';
import '../core/common/common_text_field.dart';
import '../core/common/custom_button.dart';
import '../core/common/custom_dialog.dart';
import '../core/common/safe_area_wrapper.dart';
import '../core/theme/app_colors.dart';
import '../routes/app_pages.dart';

class SetNewPassword extends StatelessWidget {
  SetNewPassword({super.key});

  final SetNewPasswordController controller = Get.put(
    SetNewPasswordController(),
  );

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeAreaWrapper(
        scrollable: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(children: [BackButtonWidget()]),
            const SizedBox(height: 20),

            const CommonText(
              "Set New Password",
              fontWeight: FontWeight.w500,
              fontSize: 24,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            const CommonText(
              "Set your new password",
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            // 🔑 New Password Field
            Obx(
              () => CommonTextField(
                hintText: "Enter Your New Password",
                controller: newPasswordController,
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
                controller: confirmPasswordController,
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
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              textAlign: TextAlign.left,
            ),

            const Spacer(),

            // ✅ Save Button with Dialog
            CustomButton(
              text: "Save",
              color: AppColors.primary,
              onPressed: () {
                Get.offNamed(Routes.mainScreen);
                Get.dialog(
                  CustomDialog(
                    title: "Congratulations",
                    message:
                        "Your account is ready to use. You will be redirected to the Home Page in a few seconds.",
                    imagePath: 'assets/images/Group-6476.png',
                  ),
                  barrierDismissible: false,
                );
              },
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

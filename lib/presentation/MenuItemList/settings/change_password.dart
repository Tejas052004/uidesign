import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uidesign/core/common/back_button_widget.dart';
import 'package:uidesign/core/common/custom_button.dart';
import 'package:uidesign/core/common/safe_area_wrapper.dart';

import '../../../controllers/signin_controller.dart';
import '../../../core/common/common_text_field.dart';
import '../../../core/theme/app_colors.dart';

class ChangePassword extends StatelessWidget {
  final SignInController controller = Get.put(SignInController());

  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeAreaWrapper(
        child: Column(
          children: [
            BackButtonWidget(title: "Change Password"),
            SizedBox(height: 30),
            Obx(
              () => CommonTextField(
                hintText: "Old Password",
                controller: oldPassword,
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
            SizedBox(height: 15),
            Obx(
              () => CommonTextField(
                hintText: "New Password",
                controller: newPassword,
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
            SizedBox(height: 15),
            Obx(
              () => CommonTextField(
                hintText: "Confirm Password",
                controller: confirmPassword,
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
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: CustomButton(text: "Save", onPressed: () {}, color: AppColors.primary,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

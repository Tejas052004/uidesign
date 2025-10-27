import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/common/back_button_widget.dart';
import '../core/common/custom_button.dart';
import '../core/common/safe_area_wrapper.dart';
import '../core/theme/app_colors.dart';
import '../routes/app_pages.dart';

// 🔹 Controller for managing password visibility
class PasswordController extends GetxController {
  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }
}

class SetPassword extends StatelessWidget {
  SetPassword({super.key});

  final PasswordController controller = Get.put(PasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeAreaWrapper(
        scrollable: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(children: [BackButtonWidget()]),

            const SizedBox(height: 30),

            const Text(
              "Set password",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            const Text(
              "Set your password",
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            // 🔑 Password Field
            Obx(
              () => TextField(
                obscureText: controller.isPasswordHidden.value,
                decoration: InputDecoration(
                  hintText: "Enter Your Password",
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: controller.togglePasswordVisibility,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 🔁 Confirm Password Field
            Obx(
              () => TextField(
                obscureText: controller.isConfirmPasswordHidden.value,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isConfirmPasswordHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: controller.toggleConfirmPasswordVisibility,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "At least 1 number or a special character",
              style: TextStyle(color: Colors.grey, fontSize: 13),
              textAlign: TextAlign.left,
            ),

            const Spacer(), // 👇 keeps button at bottom
            CustomButton(
              text: "Register",
              color: AppColors.primary,
              onPressed: () {
                Get.toNamed(Routes.profilePage);
              },
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

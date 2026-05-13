import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uidesign/core/common/common_text.dart';
import 'package:uidesign/core/common/common_text_field.dart';
import '../controllers/signin_controller.dart';
import '../core/common/back_button_widget.dart';
import '../core/common/custom_button.dart';
import '../core/common/safe_area_wrapper.dart';
import '../core/theme/app_colors.dart';
import '../routes/app_pages.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Get.find<SignInController>();

    return Scaffold(
      body: SafeAreaWrapper(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(children: [BackButtonWidget()]),

            const SizedBox(height: 10),
            const CommonText(
              "Sign in",
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 20),

            // 📧 Email or Phone Field
            CommonTextField(
              hintText: "Email or Phone Number",
              controller: controller.emailController,
            ),

            const SizedBox(height: 16),

            // 🔑 Password Field (with GetX visibility toggle)
            Obx(
              () => CommonTextField(
                hintText: "Enter Your Password",
                controller: controller.passwordController,
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

            Align(
              alignment: Alignment.centerRight,
                child: TextButton(
                onPressed: () {
                  Get.toNamed(Routes.forgetPassword);
                },
                child: const CommonText(
                  "Forgot Password?",
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                  fontSize: 14,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🔘 Sign In Button
            Obx(() => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : CustomButton(
                    text: "Sign in",
                    color: AppColors.primary,
                    onPressed: () {
                      controller.login();
                    },
                  )),

            const SizedBox(height: 20),
            Center(child: Image.asset("assets/images/Group-8.png")),
            const SizedBox(height: 30),

            // 🌐 Social Login Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.email_outlined),
                  ),
                ),
                Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.facebook_outlined),
                  ),
                ),
                Center(
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.apple)),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // 📝 Already have account?
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    const TextSpan(text: "Don’t have an account? "),
                    TextSpan(
                      text: "Sign Up",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(
                            Routes.signupScreen,
                          ); // 👈 Navigate using GetX route
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

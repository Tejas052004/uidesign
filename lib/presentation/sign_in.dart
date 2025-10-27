import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signup_controller.dart';
import '../core/common/back_button_widget.dart';
import '../core/common/custom_button.dart';
import '../core/common/safe_area_wrapper.dart';
import '../core/theme/app_colors.dart';
import '../routes/app_pages.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  // 👇 Controller init
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeAreaWrapper(
        // backgroundColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 🔙 Back Button (Reusable)
            Row(
              children: const [
                BackButtonWidget(),
              ],
            ),

            const SizedBox(height: 30),
            const Text(
              "Sign in",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),

            // 👤 Name Field
            TextField(
              decoration: InputDecoration(
                hintText: "Email or Phone Number",
                hintStyle: const TextStyle(color: Colors.grey),
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
            const SizedBox(height: 16),

            // 📧 Email Field
            TextField(
              decoration: InputDecoration(
                hintText: "Enter Your Password",
                hintStyle: const TextStyle(color: Colors.grey),
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

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Get.toNamed(Routes.forgotPassword);
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // 🔘 Sign Up Button
            CustomButton(
              text: "Sign up",
              color: AppColors.primary,
              onPressed: () {
                Get.toNamed(Routes.sendVerification);
              },
            ),

            const SizedBox(height: 20),
            Center(child: Image.asset("assets/images/Group-8.png")),
            const SizedBox(height: 30),
            Center(
              child: Image.asset(
                "assets/images/Social-Sign-up.png",
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 40),

            // 📝 Already have account?
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  children: [
                    TextSpan(text: "Don’t have an account? "),
                    TextSpan(
                      text: "Sign Up",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
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

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uidesign/core/common/common_text_field.dart';
import '../controllers/signup_controller.dart';
import '../core/common/back_button_widget.dart';
import '../core/common/common_text.dart';
import '../core/common/custom_button.dart';
import '../core/common/safe_area_wrapper.dart';
import '../core/theme/app_colors.dart';
import '../routes/app_pages.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.find<SignUpController>();
    return Scaffold(
      body: SafeAreaWrapper(
        // backgroundColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 🔙 Back Button (Reusable)
            Row(children: const [BackButtonWidget()]),

            const SizedBox(height: 10),
            const CommonText(
              "Sign Up",
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),
            const SizedBox(height: 20),

            // 👤 Name Field
            CommonTextField(hintText: "Name", controller: controller.nameController),

            const SizedBox(height: 16),

            // 📧 Email Field
            CommonTextField(
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
              controller: controller.emailController,
            ),

            const SizedBox(height: 16),

            // 📱 Mobile Number Field
            CommonTextField(
              hintText: "Your Mobile Number",
              isPhoneField: true, // 👈 Enable phone field mode
              controller: controller.phoneController,
              onCountryCodeChanged: (code) {
                print("Selected country code: $code");
              },
            ),

            const SizedBox(height: 16),

            // 👩 Gender Dropdown (Using GetX)
            Obx(
              () => CommonTextField(
                hintText: "Gender",
                isDropdownField: true,
                dropdownItems: controller.genderList,
                selectedValue: controller.selectedGender.value,
                onDropdownChanged: (value) {
                  controller.selectedGender.value = value ?? '';
                },
              ),
            ),

            const SizedBox(height: 20),

            // 🖼️ Terms Text Section
            Row(
              children: [
                Image.asset("assets/images/terms_condition.png"),
                const SizedBox(width: 10),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                      children: [
                        const TextSpan(
                          text: "By signing up, you agree to the ",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: "Terms of Service",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                        const TextSpan(text: " and "),
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                        const TextSpan(text: "."),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 🔘 Sign Up Button
            CustomButton(
              text: "Sign up",
              color: AppColors.primary,
              onPressed: () {
                Get.toNamed(Routes.verifyOtp);
              },
            ),

            const SizedBox(height: 20),
            Center(child: Image.asset("assets/images/Group-8.png")),
            const SizedBox(height: 30),
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
                    const TextSpan(text: "Already have an account? "),
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(color: AppColors.primary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(
                            Routes.signIn,
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

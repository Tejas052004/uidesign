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
  SignUpScreen({super.key});

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
            Row(children: const [BackButtonWidget()]),

            const SizedBox(height: 10),
            const CommonText(
              "Sign Up",
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),
            const SizedBox(height: 20),

            // 👤 Name Field
            CommonTextField(hintText: "Name"),

            const SizedBox(height: 16),

            // 📧 Email Field
            CommonTextField(
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 16),

            // 📱 Mobile Number Field
            CommonTextField(
              hintText: "Your Mobile Number",
              isPhoneField: true, // 👈 Enable phone field mode
              onCountryCodeChanged: (code) {
                print("Selected country code: $code");
              },
            ),

            const SizedBox(height: 16),

            // 👩 Gender Dropdown (Using GetX)
            Obx(() => CommonTextField(
              hintText: "Gender",
              isDropdownField: true,
              dropdownItems: controller.genderList,
              selectedValue: controller.selectedGender.value,
              onDropdownChanged: (value) {
                controller.selectedGender.value = value ?? '';
              },
            )),

            const SizedBox(height: 20),

            // 🖼️ Terms Text Section
            Row(
              children: [
                Image.asset("assets/images/_check-circle.png"),
                const SizedBox(width: 10),
                Expanded(
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                      children: [
                        TextSpan(
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
                        TextSpan(text: " and "),
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(text: "."),
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
                    icon: Image.asset(
                      "assets/images/Gmail.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/images/Gmail.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/images/Gmail.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // 📝 Already have account?
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(text: "Already have an account? "),
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(color: AppColors.primary),
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

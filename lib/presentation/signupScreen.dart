import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signup_controller.dart';
import '../core/common/back_button_widget.dart';
import '../core/common/custom_button.dart';
import '../core/common/safe_area_wrapper.dart';
import '../core/theme/app_colors.dart';
import '../routes/app_pages.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  // final RxString selectedGender = ''.obs;
  // final List<String> genderList = ['Male', 'Female', 'Other'];

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
              "Sign Up",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),

            // 👤 Name Field
            TextField(
              decoration: InputDecoration(
                hintText: "Name",
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
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
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

            // 📱 Mobile Number Field
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Row(
                    children: const [
                      Text("🇮🇳", style: TextStyle(fontSize: 20)),
                      SizedBox(width: 3),
                      Icon(Icons.keyboard_arrow_down, size: 18),
                    ],
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "+91",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 10),
                  Container(width: 1, height: 25, color: Colors.grey),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: "Your Mobile Number",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 👇 Gender Dropdown
            Obx(
              () => Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: controller.selectedGender.value.isEmpty
                        ? null
                        : controller.selectedGender.value,
                    isExpanded: true,
                    hint: const Text(
                      "Gender",
                      style: TextStyle(color: Colors.grey),
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    items: controller.genderList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      controller.selectedGender.value = newValue!;
                    },
                  ),
                ),
              ),
            ),

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
                        TextSpan(text: "By signing up, you agree to the "),
                        TextSpan(
                          text: "Terms of Service",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(text: " and "),
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
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
                    TextSpan(text: "Already have an account? "),
                    TextSpan(
                      text: "Sign In",
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

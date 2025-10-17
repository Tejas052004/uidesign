import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/theme/app_colors.dart';
import '../routes/app_pages.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final RxString selectedGender = ''.obs;
  final List<String> genderList = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 🔙 Back Button
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.offNamed(Routes.welcomeScreen),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 18,
                          color: Colors.black,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Back",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),

              // 👤 Name
              TextField(
                decoration: InputDecoration(
                  hint: const Text(
                    "Name",
                    style: TextStyle(color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 📧 Email
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hint: const Text(
                    "Email",
                    style: TextStyle(color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 📱 Mobile
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 6,
                      ),
                      child: Row(
                        children: const [
                          Text("🇮🇳", style: TextStyle(fontSize: 20)),
                          SizedBox(width: 3),
                          Icon(Icons.keyboard_arrow_down, size: 18),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "+91",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(width: 1, height: 25, color: Colors.grey),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          hint: Text(
                            "Your Mobile Number",
                            style: TextStyle(color: Colors.grey),
                          ),
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
                      value: selectedGender.value.isEmpty
                          ? null
                          : selectedGender.value,
                      isExpanded: true,
                      hint: const Text(
                        "Gender",
                        style: TextStyle(color: Colors.grey),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                      ),
                      dropdownColor: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      items: genderList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        selectedGender.value = newValue!;
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🖼️ Image + Text Section 👇
              Row(
                children: [
                  Image.asset("assets/images/_check-circle.png"),
                  const SizedBox(width: 10),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey, // 👈 default text color
                        ),
                        children: const [
                          TextSpan(text: "By signing up. you agree to the "),
                          TextSpan(
                            text: "Terms of Service",
                            style: TextStyle(
                              color: AppColors.primary, // 👈 custom color
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(text: " and "),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(
                              color: AppColors.primary, // 👈 custom color
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  Get.offNamed(Routes.signupScreen);
                },
                child: const Text(
                  "Sign up",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),

              SizedBox(height: 20),

              Center(child: Image.asset("assets/images/Group-8.png")),

              SizedBox(height: 20),

              // 🖼️ Second Image Below
              Center(
                child: Image.asset(
                  "assets/images/Social-Sign-up.png",
                  // height: 120, // optional
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(height: 70),

              // 📝 Text Below Second Image
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black, // default color
                    ),
                    children: const [
                      TextSpan(text: "Already have an account? "),
                      TextSpan(
                        text: "Sign In",
                        style: TextStyle(
                          color: AppColors.primary, // 👈 colored part
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
      ),
    );
  }
}

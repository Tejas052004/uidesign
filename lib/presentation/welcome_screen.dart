import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/common/custom_button.dart';
import '../core/theme/app_colors.dart';
import '../routes/app_pages.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset("assets/images/Welcome-Screen.png"),

              const SizedBox(height: 30),

              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              const Text(
                "Have a better sharing experience",
                style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),

              Spacer(),

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ElevatedButton(
                  //   style: OutlinedButton.styleFrom(
                  //     backgroundColor: AppColors.primary,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(6),
                  //     ),
                  //     padding: EdgeInsets.symmetric(vertical: 15),
                  //   ),
                  //   onPressed: () {
                  //     Get.offNamed(Routes.signupScreen);
                  //   },
                  //   child: Text(
                  //     "Create an account",
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  // ),
                  CustomButton(
                    text: "Create an account",
                    color: AppColors.primary,
                    onPressed: () {
                      Get.toNamed(Routes.signupScreen);
                    },
                  ),

                  SizedBox(height: 15),

                  // OutlinedButton(
                  //   style: OutlinedButton.styleFrom(
                  //     side: const BorderSide(
                  //       color: AppColors.primary,
                  //       width: 1,
                  //     ),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(6),
                  //     ),
                  //     padding: EdgeInsets.symmetric(vertical: 15)
                  //   ),
                  //   onPressed: () {},
                  //   child: Text(
                  //     "Log In",
                  //     style: TextStyle(color: AppColors.primary),
                  //   ),
                  // ),
                  CustomButton(
                    text: "Log In",
                    // color: AppColors.primary,
                    onPressed: () {
                      Get.toNamed(Routes.signIn);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

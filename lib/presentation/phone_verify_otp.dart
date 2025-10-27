import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../core/common/custom_button.dart';
import '../core/common/safe_area_wrapper.dart';
import '../core/common/back_button_widget.dart'; // 👈 import added
import '../core/theme/app_colors.dart';
import '../routes/app_pages.dart';

class PhoneVerifyOtp extends StatelessWidget {
  PhoneVerifyOtp({super.key});

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeAreaWrapper(
        scrollable: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),

            // 🔙 Back Button (Reusable)
            BackButtonWidget(),

            const SizedBox(height: 20),

            // 📱 Title
            const Text(
              "Forgot Password",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            const Text(
              "Code has been send to ***** ***70",
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            // 🔢 OTP Input Boxes
            Center(
              child: Pinput(
                length: 6, // OTP digits
                controller: otpController,
                defaultPinTheme: PinTheme(
                  width: 50,
                  height: 56,
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 50,
                  height: 56,
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.primary, width: 2),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🔁 Resend text
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  children: [
                    TextSpan(text: "Didn’t receive code? "),
                    TextSpan(
                      text: "Resend again",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // 🔘 Verify Button
            CustomButton(
              text: "Verify",
              color: AppColors.primary,
              onPressed: () {
                // Handle OTP verification logic here
                Get.offNamed(Routes.setNewPassword);
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

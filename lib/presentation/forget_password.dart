import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/common/back_button_widget.dart';
import '../core/common/custom_button.dart';
import '../core/common/safe_area_wrapper.dart';
import '../core/theme/app_colors.dart';
import '../routes/app_pages.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

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
              "Forgot Password",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            const Text(
              "Select which contact details should we use to reset your password",
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            // 📩 SMS Card
            Card(
              // elevation: 3,
              color: Color(0xFFFFFBE7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1.5),
                side: BorderSide(color: AppColors.primary),
              ),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white, // inner white circle
                    border: Border.all(
                      color: const Color(0xFFFFC107), // yellow border
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.message, // or Icons.message for chat
                    color: Color(0xFFFFC107), // yellow icon color
                    size: 20,
                  ),
                ),
                title: const Text(
                  "Via SMS",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                subtitle: const Text(
                  "***** ***70",
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: () {
                },
              ),
            ),

            SizedBox(height: 10,),

            // 📩 Email Card
            Card(
              color: const Color(0xFFFFFBE7), // light yellow background
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1.5),
                side: const BorderSide(
                  color: Color(0xFFFFC107), // yellow border
                  width: 1,
                ),
              ),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white, // inner white circle
                    border: Border.all(
                      color: const Color(0xFFFFC107), // yellow border
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Icons.email_outlined, // or Icons.message for chat
                    color: Color(0xFFFFC107), // yellow icon color
                    size: 20,
                  ),
                ),
                title: const Text(
                  "Via Email",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                subtitle: const Text(
                  "**** **** **** xyz@xyz.com",
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: () {},
              ),
            ),

            const SizedBox(height: 16),

            const Spacer(),
            CustomButton(
              text: "Continue",
              color: AppColors.primary,
              onPressed: () {
                Get.toNamed(Routes.phoneVerifyOtp);
              },
            ),

            const SizedBox(height: 16), // small bottom padding
          ],
        ),
      ),
    );
  }
}

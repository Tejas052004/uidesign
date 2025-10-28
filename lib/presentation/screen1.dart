import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/common/safe_area_wrapper.dart'; // 👈 import your wrapper
import '../../../routes/app_pages.dart';
import '../core/common/common_text.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeAreaWrapper(
        scrollable: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 🔝 Skip text (replaces AppBar)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Get.offNamed(Routes.screen2),
                  child: const CommonText(
                    "Skip",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 🖼️ Main Image
            Image.asset(
              "assets/images/Anywhere you are.png",
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 30),

            // 🧩 Title
            const CommonText(
              "Anywhere you are",
              fontSize: 24,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            // 📜 Description
            const Padding(
              padding: EdgeInsets.all(16),
              child: CommonText(
                "Sell houses easily with the help of Listenoryx and to make this line big I am writing more.",
                fontWeight: FontWeight.w500,
                fontSize: 14,
                textAlign: TextAlign.center,
              ),
            ),

            const Spacer(),

            // ⏭️ Next Button Image
            GestureDetector(
              onTap: () => Get.offNamed(Routes.screen2),
              child: Center(child: Image.asset("assets/images/Group 296.png")),
            ),
          ],
        ),
      ),
    );
  }
}

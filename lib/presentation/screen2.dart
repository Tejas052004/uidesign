import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        actions: [
          TextButton(
            onPressed: () {
              Get.offNamed(Routes.screen3); // 👈 example navigation
            },
            child: const Text("Skip", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset("assets/images/At-anytime.png"),
            const SizedBox(height: 30),
            const Text(
              "At anytime",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16),
              child: const Text(
                "Sell houses easily with the help of Listenoryx and to make this line big I am writing more.",
                style: TextStyle(
                  color: Colors.grey
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Get.offNamed(Routes.screen3); // or next onboarding
              },
              child: Image.asset("assets/images/Group-297.png"),
            ),
          ],
        ),
      ),
    );
  }
}

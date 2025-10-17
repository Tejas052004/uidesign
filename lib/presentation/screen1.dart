import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        actions: [
          TextButton(
            onPressed: () {
              Get.offNamed(Routes.screen2);
            },
            child: const Text("Skip", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset("assets/images/Anywhere you are.png"),
            const SizedBox(height: 30),
            const Text(
              "Anywhere you are",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16),
              child: const Text(
                "Sell houses easily with the help of Listenoryx and to make this line big I am writing more.",
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Get.offNamed(Routes.screen2); // or next onboarding
              },
              child: Image.asset("assets/images/Group 296.png"),
            ),
          ],
        ),
      ),
    );
  }
}

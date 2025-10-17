import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _goNext();
  }

  void _goNext() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offNamed(Routes.screen1); // 👈 replaces Navigator.pushReplacementNamed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/Logo.png"),
            const SizedBox(height: 30),
            Image.asset("assets/images/Infinity-1s-200px.png"),
          ],
        ),
      ),
    );
  }
}

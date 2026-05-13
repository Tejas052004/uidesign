import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/base/base_controller.dart';

class SignInController extends BaseController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      showError("Please enter email and password");
      return;
    }

    showLoading();
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    hideLoading();

    // Navigate to home
    Get.offAllNamed('/mainScreen');
  }
}

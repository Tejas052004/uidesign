import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/base/base_controller.dart';

class SetNewPasswordController extends BaseController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Password visibility toggles
  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  // Toggle functions
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }
}

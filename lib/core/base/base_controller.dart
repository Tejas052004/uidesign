import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final RxBool isLoading = false.obs;

  void showLoading() => isLoading.value = true;
  void hideLoading() => isLoading.value = false;

  void showError(String message) {
    // ScaffoldMessenger is significantly more stable than GetX snackbars
    // when dealing with complex navigation stacks or Overlay issues.
    final context = Get.context;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(16),
        ),
      );
    } else {
      debugPrint("App Error: $message");
    }
  }
}

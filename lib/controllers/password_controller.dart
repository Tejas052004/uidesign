import 'package:get/get.dart';

class SetNewPasswordController extends GetxController {
  // Password visibility toggles
  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;

  // Toggle functions
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }
}

import 'package:get/get.dart';
import '../controllers/signin_controller.dart';
import '../controllers/signup_controller.dart';
import '../controllers/password_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
    Get.lazyPut<SignUpController>(() => SignUpController());
    Get.lazyPut<SetNewPasswordController>(() => SetNewPasswordController());
  }
}

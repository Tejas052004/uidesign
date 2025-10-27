import 'package:get/get.dart';

class SignUpController extends GetxController {
  // Gender list
  final List<String> genderList = ['Male', 'Female', 'Other'];

  // Selected gender reactive variable
  final RxString selectedGender = ''.obs;

// Optional: tamara form ma biji values add karvi hoy to ahiya kari sako
// final nameController = TextEditingController();
// final emailController = TextEditingController();
// final phoneController = TextEditingController();
}

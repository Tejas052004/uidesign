import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/base/base_controller.dart';

class SignUpController extends BaseController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  // 👨‍🦱 Gender list
  final List<String> genderList = ['Male', 'Female', 'Other'];
  final RxString selectedGender = ''.obs;

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  // 🏙 City list
  final List<String> cityList = [
    'Ahmedabad',
    'Surat',
    'Vadodara',
    'Rajkot',
    'Bhavnagar',
    'Jamnagar',
    'Gandhinagar',
    'Junagadh',
  ];
  final RxString selectedCity = ''.obs;

  // 📍 District list
  final List<String> districtList = [
    'Ahmedabad',
    'Surat',
    'Vadodara',
    'Rajkot',
    'Bhavnagar',
    'Jamnagar',
    'Gandhinagar',
    'Junagadh',
  ];
  final RxString selectedDistrict = ''.obs;
}

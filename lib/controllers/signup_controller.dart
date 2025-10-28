import 'package:get/get.dart';

class SignUpController extends GetxController {
  // 👨‍🦱 Gender list
  final List<String> genderList = ['Male', 'Female', 'Other'];
  final RxString selectedGender = ''.obs;

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

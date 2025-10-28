import 'package:get/get.dart';

class HomePageController extends GetxController {
  // Selected option name
  var selectedOption = 'Transport'.obs;

  void selectTransport() {
    selectedOption.value = 'Transport';
  }

  void selectDelivery() {
    selectedOption.value = 'Delivery';
  }

  void selectRental() {
    selectedOption.value = 'Rental';
  }
}

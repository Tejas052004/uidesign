import 'package:get/get.dart';

class HomePageController extends GetxController {
  // Selected option name
  var selectedOption = 'Transport'.obs;
  var selectedUpComing = 'UpComing'.obs;

  void selectTransport() {
    selectedOption.value = 'Transport';
  }

  void selectDelivery() {
    selectedOption.value = 'Delivery';
  }

  void selectRental() {
    selectedOption.value = 'Rental';
  }

  void selectUpComing() {
    selectedUpComing.value = 'UpComing';
  }

  void selectCompleted() {
    selectedUpComing.value = 'Completed';
  }

  void selectCancelled() {
    selectedUpComing.value = 'Cancelled';
  }
}

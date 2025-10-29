import 'package:get/get.dart';
import 'package:uidesign/routes/app_pages.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
    // 👇 Offer icon (index = 3) click karta Offer screen open thase
    if (index == 3) {
      Get.toNamed(Routes.notificationScreen);
    }
  }
}

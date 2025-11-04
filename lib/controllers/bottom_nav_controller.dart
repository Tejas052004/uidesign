import 'package:get/get.dart';

class BottomNavController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void changeIndex(int index) {
    if (index >= 0 && index < 4) { // ✅ valid only for 4 screens
      selectedIndex.value = index;
    }
  }
}

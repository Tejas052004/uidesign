import 'package:get/get.dart';
import '../controllers/bottom_nav_controller.dart';
import '../controllers/homepage_controller.dart';
import '../controllers/map_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
    Get.lazyPut(() => HomePageController(), fenix: true);
    Get.lazyPut(() => MapController(), fenix: true);
  }
}

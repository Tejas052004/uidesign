import 'package:get/get.dart';
import '../controllers/homepage_controller.dart';
import '../controllers/map_controller.dart';
import '../controllers/bottom_nav_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController(), fenix: true);
    Get.lazyPut<HomePageController>(() => HomePageController(), fenix: true);
    Get.lazyPut<MapController>(() => MapController(), fenix: true);
  }
}

import 'package:get/get.dart';
import '../controllers/homepage_controller.dart';
import '../controllers/map_controller.dart';
import '../controllers/bottom_nav_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Using put with permanent: false but ensuring it's scoped to the route properly
    Get.put(BottomNavController());
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut<MapController>(() => MapController());
  }
}

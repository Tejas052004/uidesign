import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uidesign/controllers/homepage_controller.dart';
import 'package:uidesign/core/common/home_page_card.dart';
import 'package:uidesign/core/theme/app_colors.dart';
import 'package:uidesign/presentation/Menu/side_menu.dart';
import '../../controllers/map_controller.dart';
import '../../core/common/safe_area_wrapper.dart';
import '../controllers/bottom_nav_controller.dart';
import '../core/common/custom_bottom_nav.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final MapController controller = Get.find<MapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // key: navController.scaffoldKey, // connect controller key
      // endDrawer: SizedBox(
      //   width: MediaQuery.of(context).size.width * 0.75, // 75% of screen width
      //   child: const SideMenu(),
      // ),

      // bottomNavigationBar: CustomBottomNav(onTap: (index) {  }, currentIndex: null,),

      body: SafeAreaWrapper(
        padding: EdgeInsets.zero,
        scrollable: false,
        // map code
        child: Stack(
          children: [
            // ✅ Google Map
            Obx(() {
              if (!controller.isMapReady.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return GoogleMap(
                onMapCreated: controller.onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: controller.currentPosition.value,
                  zoom: 15,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                markers: controller.markers,
              );
            }),

            Positioned(
              top: 20,
              left: 10,
              right: 10,
              child: const HomePageCard(),
            ),
          ],
        ),
      ),
    );
  }
}
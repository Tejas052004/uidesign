import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uidesign/core/common/custom_button.dart';
import 'package:uidesign/core/common/home_page_card.dart';
import 'package:uidesign/core/theme/app_colors.dart';
import '../../controllers/map_controller.dart';
import '../../core/common/safe_area_wrapper.dart';
import '../core/common/custom_bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final MapController controller = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // ✅ Add this line
      bottomNavigationBar: const CustomBottomNav(), // 👈 Custom bottom navigation call here

      body: SafeAreaWrapper(
        padding: EdgeInsets.zero,
        scrollable: false,
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
                child: const HomePageCard()),

          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.lightYellow,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, color: Colors.black87, size: 22),
      ),
    );
  }
}

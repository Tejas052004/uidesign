import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uidesign/core/common/common_text.dart';
import 'package:uidesign/core/common/custom_button.dart';
import 'package:uidesign/core/theme/app_colors.dart';
import '../../controllers/map_controller.dart';
import '../../core/common/safe_area_wrapper.dart';
import '../routes/app_pages.dart';

class ConfirmRide extends StatelessWidget {
  ConfirmRide({super.key});

  final MapController controller = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    // 🔹 Automatically open bottom sheet after first frame render
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showRideBottomSheet(context);
    });

    return Scaffold(
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

            // ✅ Top-right Menu Icon
            Positioned(
              top: 20,
              right: 16,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.menuIconBgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Bottom sheet function
  void _showRideBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeAreaWrapper(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🔹 Close Icon
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.black),
                    onPressed: () => Get.back(),
                  ),
                ),

                const SizedBox(height: 10),

                const CommonText(
                  "Your driver is coming in 3:35",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),

                const Divider(thickness: 1, color: Colors.grey),

                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        "assets/images/Rectangle-553.png",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            "Sergio Ramasis",
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.grey,
                                size: 16,
                              ),
                              CommonText(
                                "800m (5 mins away)",
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.primary,
                                size: 16,
                              ),
                              CommonText(
                                "4.9 (531 reviews)",
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      "assets/images/Car.png",
                      width: 80,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),

                const Divider(thickness: 1, color: Colors.grey),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      "Payment method",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    CommonText(
                      "\$220.00",
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ],
                ),

                SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF6E5),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.primary),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/Payment.png",
                        width: 60,
                        height: 40,
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            "**** **** **** 8970",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          SizedBox(height: 4),
                          CommonText(
                            "Expires: 12/26",
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary, width: 2),
                      ),
                      child: Icon(Icons.call, color: AppColors.primary),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary, width: 2),
                      ),
                      child: Icon(Icons.message, color: AppColors.primary),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: CustomButton(
                        onPressed: () => Get.toNamed(Routes.cancelRide),
                        text: "Cancel Ride",
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

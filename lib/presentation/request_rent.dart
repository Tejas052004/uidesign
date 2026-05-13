import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uidesign/core/common/back_button_widget.dart';
import 'package:uidesign/core/common/common_text.dart';
import 'package:uidesign/core/common/safe_area_wrapper.dart';
import '../core/common/custom_button.dart';
import '../core/common/custom_dialog.dart';
import '../core/theme/app_colors.dart';
import '../routes/app_pages.dart';

class RequestRent extends StatelessWidget {
  const RequestRent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeAreaWrapper(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackButtonWidget(title: "Request for rent"),
            const SizedBox(height: 20),

            // 🔹 Locations Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ Current Location
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_on, color: Colors.red),
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CommonText(
                          "Current location",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        CommonText(
                          "2972 Westheimer Rd. Santa Ana, Illinois 85486",
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),

                // 🔹 Vertical Line Between Locations
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    width: 2,
                    height: 30,
                    color: Colors.grey.shade400,
                  ),
                ),

                // ✅ Destination Location
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on, color: AppColors.primary),
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CommonText(
                          "Office",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        CommonText(
                          "1901 Thornridge Cir. Shiloh, Hawaii 81063",
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 🔹 Car Info Box
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.lightYellow,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: AppColors.primary),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CommonText(
                          "Mustang Shelby GT",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        SizedBox(height: 4),
                        CommonText(
                          "4.9 (531 reviews)",
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  Image.asset('assets/images/Car.png', width: 80, height: 50),
                ],
              ),
            ),

            // 🔹 Charge Details
            const Row(
              children: [
                CommonText("Charge", fontSize: 16, fontWeight: FontWeight.w500),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: const [
                Row(
                  children: [
                    CommonText(
                      "Mustang/per hours",
                      fontWeight: FontWeight.w400,
                    ),
                    Spacer(),
                    CommonText("200", fontWeight: FontWeight.w400),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    CommonText("Vat (5%)", fontWeight: FontWeight.w400),
                    Spacer(),
                    CommonText("20", fontWeight: FontWeight.w400),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    CommonText("Promo Code", fontWeight: FontWeight.w400),
                    Spacer(),
                    CommonText("-5", fontWeight: FontWeight.w400),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 🔹 Payment Method Header
            Row(
              children: [
                const CommonText(
                  "Select payment method",
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.allPaymentMethod),
                  child: CommonText(
                    "View All",
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                    fontSize: 16,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // 🔹 Payment Cards
            _buildPaymentCard('assets/images/Payment.png'),
            _buildPaymentCard('assets/images/Payment-1.png'),

            // 🔹 Confirm Button
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(
                  text: "Confirm Ride",
                  onPressed: () {
                    Get.dialog(
                      const CustomDialog(
                        title: "Thank you",
                        message: "Your booking has been placed sent to Md. Sharif Ahmed",
                        imagePath: 'assets/images/Group-6476.png',
                      ),
                      barrierDismissible: false,
                    );

                    // 🔹 Auto-close after 2 seconds and navigate to HomeScreen
                    Future.delayed(const Duration(seconds: 2), () {
                      // Safety check: only go back if a dialog is actually open
                      if (Get.isDialogOpen ?? false) {
                        Get.back();
                      }
                      Get.toNamed(Routes.confirmRide);
                    });
                  },
                  color: AppColors.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 🔸 Reusable payment card widget
  Widget _buildPaymentCard(String imagePath) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.lightYellow,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.primary),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath, width: 80, height: 50),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CommonText(
                  "**** **** **** 8970",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                SizedBox(height: 4),
                CommonText(
                  "Expires: 12/26",
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

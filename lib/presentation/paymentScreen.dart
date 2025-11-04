import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uidesign/core/common/back_button_widget.dart';
import 'package:uidesign/core/common/common_text.dart';
import 'package:uidesign/core/common/common_text_field.dart';
import 'package:uidesign/core/common/custom_dialog.dart';
import 'package:uidesign/core/common/safe_area_wrapper.dart';
import '../core/common/custom_button.dart';
import '../core/theme/app_colors.dart';
import '../routes/app_pages.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeAreaWrapper(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackButtonWidget(title: "Payment"),

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
                const Divider(thickness: 1, color: Colors.grey),
                SizedBox(height: 10),
                Row(
                  children: [
                    CommonText("Total", fontWeight: FontWeight.w400),
                    Spacer(),
                    CommonText("215", fontWeight: FontWeight.w400),
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
                      CustomDialog(
                        title: "Payment Success",
                        message: "Your money has been successfully sent to Sergio Ramasis",
                        amount: "\$215",
                        imagePath: 'assets/images/Group-6476.png',
                        buttonText: "Please Feedback",
                        onPressed: () {
                          Get.back(); // close dialog
                          _showRideBottomSheet(context); // call your bottom sheet
                        },
                      ),
                      barrierDismissible: false,
                    );
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 🔹 Close Icon on Top
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.black),
                  onPressed: () => Get.back(),
                ),
              ),

              const SizedBox(height: 10),

              // 🔹 Star Icon in Center
              Icon(Icons.star, color: AppColors.primary),

              const SizedBox(height: 20),

              CommonText(
                "Excellent",
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),

              const SizedBox(height: 10),

              CommonText(
                "You rated Sergio Ramasis 4 star",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),

              const SizedBox(height: 10),

              CommonTextField(hintText: "Write your text", maxLines: 4),

              const SizedBox(height: 20),

              CommonText(
                "Give some tips to Sergio Ramasis",
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),

              const SizedBox(height: 15),

              // 🔹 Added: Tip boxes row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _tipBox("\$1"),
                  _tipBox("\$2"),
                  _tipBox("\$5"),
                  _tipBox("\$10"),
                  _tipBox("\$20"),
                ],
              ),

              const SizedBox(height: 10),

              CommonText(
                "Enter other amount",
                color: AppColors.primary,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: "Submit",
                      onPressed: () {
                        Get.dialog(
                          CustomDialog(
                            title: "Thank you",
                            message: "Thank you for your valuable feedback and tip",
                            imagePath: 'assets/images/Group-6476.png',
                            buttonText: "Back Home",
                            onPressed: () {
                              Get.toNamed(Routes.mainScreen);
                            },
                          ),
                          barrierDismissible: false,
                        );
                      },
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // 🔹 Helper Widget for Tip Box
  Widget _tipBox(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        // color: AppColors.lightYellow,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: CommonText(text, fontWeight: FontWeight.w500, fontSize: 14),
    );
  }
}

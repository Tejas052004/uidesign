import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uidesign/core/common/back_button_widget.dart';
import 'package:uidesign/core/common/common_text.dart';
import 'package:uidesign/core/common/safe_area_wrapper.dart';

import '../core/common/custom_button.dart';
import '../core/theme/app_colors.dart';
import '../routes/app_pages.dart';

class RequestRent extends StatelessWidget {
  const RequestRent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeAreaWrapper(
        child: Column(
          children: [
            BackButtonWidget(title: "Request for rent"),
            SizedBox(height: 20),
            Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.red),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.location_on, color: AppColors.primary),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.lightYellow,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: AppColors.primary),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              "Mustang Shelby GT",
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                CommonText(
                                  "4.9 (531 reviews)",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // 🚘 Car Image
                      Image.asset(
                        'assets/images/Car.png',
                        width: 80,
                        height: 50,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                CommonText("Charge", fontSize: 16, fontWeight: FontWeight.w500),
              ],
            ),
            SizedBox(height: 10),
            Column(
              children: [
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
                SizedBox(height: 20),
                Row(
                  children: [
                    CommonText(
                      "Select payment method",
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(Routes.allPaymentMethod);
                      },
                      child: CommonText(
                        "View All",
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.lightYellow,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.primary),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/Payment.png',
                            width: 80,
                            height: 50,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  "**** **** **** 8970",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    CommonText(
                                      "Expires: 12/26",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.lightYellow,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.primary),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/Payment-1.png',
                            width: 80,
                            height: 50,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  "**** **** **** 8970",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    CommonText(
                                      "Expires: 12/26",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomButton(text: "Confirm Ride", onPressed: (){}, color: AppColors.primary,),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

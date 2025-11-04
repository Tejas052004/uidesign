import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uidesign/core/common/common_text.dart';
import 'package:uidesign/core/common/safe_area_wrapper.dart';
import '../core/common/custom_button.dart';
import '../core/theme/app_colors.dart';

class OfferScreen extends StatelessWidget {
  final List<Map<String, dynamic>> offers = const [
    {
      "title": "Discount 15% off",
      "subtitle": "Special Promo valid for Black Friday",
    },
    {
      "title": "Discount 15% off",
      "subtitle": "Special Promo valid for Black Friday",
    },
    {
      "title": "Discount 15% off",
      "subtitle": "Special Promo valid for Black Friday",
    },
    {
      "title": "Discount 15% off",
      "subtitle": "Special Promo valid for Black Friday",
    },
    {
      "title": "Discount 15% off",
      "subtitle": "Special Promo valid for Black Friday",
    },
    {
      "title": "Discount 15% off",
      "subtitle": "Special Promo valid for Black Friday",
    },
    {
      "title": "Discount 15% off",
      "subtitle": "Special Promo valid for Black Friday",
    },
    {
      "title": "Discount 15% off",
      "subtitle": "Special Promo valid for Black Friday",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🔹 Fixed header
              CommonText(
                "Special Offer",
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 20),

              // 🔹 Scrollable offer list
              Expanded(
                child: ListView.builder(
                  itemCount: offers.length,
                  padding: const EdgeInsets.only(bottom: 20),
                  itemBuilder: (context, index) {
                    final offer = offers[index];
                    return GestureDetector(
                      onTap: () {
                        _showRideBottomSheet(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.primary, width: 1),
                        ),
                        child: Row(
                          children: [
                            // 🔸 Yellow circular background with red icon
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFF7E6),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.shopping_bag,
                                color: Colors.red,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 12),

                            // 🔹 Offer text
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  offer["title"],
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                                const SizedBox(height: 4),
                                CommonText(
                                  offer["subtitle"],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🔹 Close Icon at top-right
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.black),
                    onPressed: () => Get.back(),
                  ),
                ),
                const SizedBox(height: 10),
                const CommonText(
                  "Special Offer",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
                const Divider(thickness: 1, color: Colors.grey),
                const SizedBox(height: 20),
                Image.asset("assets/images/discount.png", width: 100, height: 100),
                const SizedBox(height: 10),
                const CommonText(
                  "Discount 15% off",
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 10),
                const CommonText(
                  "Special Promo valid for Black Friday",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
                const SizedBox(height: 25),
                Container(
                  width: 130,
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFFE89C), Color(0xFFFFF6D3)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const CommonText(
                        "DISC35",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Coupon code copied!"),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                        child: const Icon(Icons.copy_rounded, size: 22, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(thickness: 1, color: Colors.grey),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText("Terms and Conditions", fontWeight: FontWeight.w500),
                    const SizedBox(height: 10),
                    CommonText(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                    CommonText(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                    CommonText(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "Use Promo",
                        onPressed: () {},
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

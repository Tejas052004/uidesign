import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uidesign/core/common/back_button_widget.dart';
import 'package:uidesign/core/common/common_text.dart';
import 'package:uidesign/core/common/custom_button.dart';
import 'package:uidesign/core/common/safe_area_wrapper.dart';
import '../core/theme/app_colors.dart';
import '../routes/app_pages.dart';

class CarDetails extends StatefulWidget {
  const CarDetails({super.key});

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  // 🔹 Car Specifications List
  final List<Map<String, String>> specifications = [
    {
      'image': 'assets/images/Max-Power.png',
      'title': 'Max. power',
      'subtitle': '2500hp',
    },
    {
      'image': 'assets/images/Fual.png',
      'title': 'Fuel',
      'subtitle': '10km per litre',
    },
    {
      'image': 'assets/images/Speed.png',
      'title': 'Max. speed',
      'subtitle': '230kph',
    },
    {
      'image': 'assets/images/mph.png',
      'title': '0–60mph',
      'subtitle': '2.5sec',
    },
  ];

  // 🔹 Car Features List
  final List<Map<String, String>> features = [
    {'title': 'Model', 'value': 'GT5000'},
    {'title': 'Capacity', 'value': '760hp'},
    {'title': 'Color', 'value': 'Red'},
    {'title': 'Fuel type', 'value': 'Octane'},
    {'title': 'Gear type', 'value': 'Automatic'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 🔹 Fixed AppBar (not scrollable)
              const BackButtonWidget(),

              // 🔹 Scrollable content below
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          "Mustang Shelby GT",
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                        CommonText(
                          "4.9 (531 reviews)",
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(height: 20),

                        // 🔹 Car Image
                        Center(
                          child: Image.asset(
                            "assets/images/Car.png",
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                        ),

                        const SizedBox(height: 20),
                        CommonText(
                          "Specifications",
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                        const SizedBox(height: 10),

                        // 🔹 Specifications Grid
                        GridView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: specifications.length,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            final spec = specifications[index];
                            return _buildSpecificationCard(
                              imagePath: spec['image']!,
                              title: spec['title']!,
                              subtitle: spec['subtitle']!,
                            );
                          },
                        ),

                        const SizedBox(height: 20),
                        CommonText(
                          "Car features",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(height: 10),

                        // 🔹 Car Features Grid
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: features.length,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 10,
                            childAspectRatio: 6,
                          ),
                          itemBuilder: (context, index) {
                            final feature = features[index];
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFDF3),
                                border:
                                Border.all(color: AppColors.primary, width: 1.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonText(
                                    feature['title']!,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  CommonText(
                                    feature['value']!,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 30),

                        Row(
                          children: [
                            // 🕒 Book later
                            Expanded(
                              child: CustomButton(
                                onPressed: () {},
                                text: 'Book later',
                              ),
                            ),
                            const SizedBox(width: 10),

                            // 🚀 Ride now
                            Expanded(
                              child: CustomButton(
                                onPressed: () {
                                  Get.toNamed(Routes.requestRent);
                                },
                                text: 'Ride Now',
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Specification Card Widget
  Widget _buildSpecificationCard({
    required String imagePath,
    required String title,
    required String subtitle,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF3),
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 30, height: 30),
          const SizedBox(height: 4),
          CommonText(title, fontSize: 10, fontWeight: FontWeight.w500),
          CommonText(subtitle, fontSize: 8, fontWeight: FontWeight.w400),
        ],
      ),
    );
  }
}

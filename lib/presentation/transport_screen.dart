import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uidesign/core/common/common_text.dart';
import '../../core/common/back_button_widget.dart';
import '../../core/theme/app_colors.dart';
import '../routes/app_pages.dart';

class TransportScreen extends StatelessWidget {
  const TransportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy transport options (image + name)
    final List<Map<String, String>> transportOptions = [
      {"name": "Car", "image": "assets/images/Car.png"},
      {"name": "Bike", "image": "assets/images/Bike.png"},
      {"name": "Cycle", "image": "assets/images/Cycle.png"},
      {"name": "Taxi", "image": "assets/images/Taxi.png"},
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButtonWidget(title: "Select transport", fontSize: 18),

              const SizedBox(height: 20),

              Row(
                children: [
                  CommonText(
                    "Select your transport",
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              SizedBox(height: 30),

              // 🚘 Grid of Transport Options
              Expanded(
                child: GridView.builder(
                  itemCount: transportOptions.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 columns
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    // childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final item = transportOptions[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.availableCars);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.lightYellow,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.primary),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  item["image"]!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item["name"]!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
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
}

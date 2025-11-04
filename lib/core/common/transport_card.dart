import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uidesign/core/common/custom_button.dart';
import 'package:uidesign/routes/app_pages.dart';
import '../theme/app_colors.dart';

class TransPortCard extends StatelessWidget {
  final String name;
  final String type;
  final String seats;
  final String fuel;
  final String distance;
  final String time;
  final String image;
  final bool isSelected;
  final VoidCallback onTap;

  const TransPortCard({
    super.key,
    required this.name,
    required this.type,
    required this.seats,
    required this.fuel,
    required this.distance,
    required this.time,
    required this.image,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.lightYellow,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.primary
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🚗 Top row: car info + image
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 📝 Car details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            type,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                          const Text(
                            "  |  ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            "$seats seats",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                          const Text(
                            "  |  ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            fuel,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 16,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "$distance ($time away)",
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // 🚘 Car Image
                Image.asset(image, width: 80, height: 70,),
              ],
            ),

            const SizedBox(height: 12),

            // 🔘 Buttons row
            Row(
              children: [
                // 🕒 Book later
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      Get.back();
                    },
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
          ],
        ),
      ),
    );
  }
}

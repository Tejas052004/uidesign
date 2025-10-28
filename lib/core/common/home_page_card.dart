import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/homepage_controller.dart';
import '../theme/app_colors.dart';

class HomePageCard extends StatelessWidget {
  const HomePageCard({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageController controller = Get.put(HomePageController());

    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightYellow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 🔍 Search Bar
          Container(
            decoration: BoxDecoration(
              color: AppColors.lightYellow,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.primary),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Where would you go?",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Icon(Icons.favorite_border, color: Colors.grey),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          // 🚗 Transport / Delivery / Rental buttons with GetX
          Obx(() {
            String selected = controller.selectedOption.value;
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary),
                borderRadius: BorderRadius.circular(10.7)
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: controller.selectTransport,
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: selected == 'Transport'
                              ? AppColors.primary
                              : AppColors.lightYellow,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          // border: Border.all(color: AppColors.primary),
                        ),
                        child: Center(
                          child: Text(
                            "Transport",
                            style: TextStyle(
                              color: selected == 'Transport'
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: GestureDetector(
                      onTap: controller.selectDelivery,
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: selected == 'Delivery'
                              ? AppColors.primary
                              : AppColors.lightYellow,
                          // border: Border.all(color: AppColors.primary),
                        ),
                        child: Center(
                          child: Text(
                            "Delivery",
                            style: TextStyle(
                              color: selected == 'Delivery'
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: GestureDetector(
                      onTap: controller.selectRental,
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: selected == 'Rental'
                              ? AppColors.primary
                              : AppColors.lightYellow,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          // border: Border.all(color: AppColors.primary),
                        ),
                        child: Center(
                          child: Text(
                            "Rental",
                            style: TextStyle(
                              color: selected == 'Rental'
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

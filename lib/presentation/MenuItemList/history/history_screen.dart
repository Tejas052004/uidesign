import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uidesign/controllers/homepage_controller.dart';
import 'package:uidesign/core/common/back_button_widget.dart';
import 'package:uidesign/core/common/common_text.dart';
import 'package:uidesign/core/common/safe_area_wrapper.dart';
import 'package:uidesign/presentation/MenuItemList/history/cancelledScreen.dart';
import 'package:uidesign/presentation/MenuItemList/history/completedScreen.dart';
import 'package:uidesign/presentation/MenuItemList/history/upcomingScreen.dart';
import '../../../core/theme/app_colors.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageController controller = Get.find<HomePageController>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔙 Back button + Title
              BackButtonWidget(title: "History"),
              const SizedBox(height: 10),

              // 🟡 Tabs
              Obx(() {
                String selected = controller.selectedUpComing.value;
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(10.7),
                  ),
                  child: Row(
                    children: [
                      // --- Upcoming Tab ---
                      Expanded(
                        child: GestureDetector(
                          onTap: controller.selectUpComing,
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: selected == 'UpComing'
                                  ? AppColors.primary
                                  : AppColors.lightYellow,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: CommonText(
                                "UpComing",
                                color: selected == 'UpComing'
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // --- Completed Tab ---
                      Expanded(
                        child: GestureDetector(
                          onTap: controller.selectCompleted,
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: selected == 'Completed'
                                  ? AppColors.primary
                                  : AppColors.lightYellow,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: CommonText(
                                "Completed",
                                color: selected == 'Completed'
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // --- Cancelled Tab ---
                      Expanded(
                        child: GestureDetector(
                          onTap: controller.selectCancelled,
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: selected == 'Cancelled'
                                  ? AppColors.primary
                                  : AppColors.lightYellow,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: CommonText(
                                "Cancelled",
                                color: selected == 'Cancelled'
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),

              const SizedBox(height: 10),

              // 📋 Tab Content Section
              Expanded(
                child: Obx(() {
                  final selected = controller.selectedUpComing.value;

                  if (selected == 'UpComing') {
                    return const UpcomingScreen();
                  } else if (selected == 'Completed') {
                    return const CompletedScreen();
                  } else {
                    return const CancelledScreen();
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

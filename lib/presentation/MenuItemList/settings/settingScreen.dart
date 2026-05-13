import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uidesign/core/common/back_button_widget.dart';
import 'package:uidesign/core/common/safe_area_wrapper.dart';

import '../../../core/theme/app_colors.dart';
import '../../../routes/app_pages.dart';
import 'change_password.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = [
      "Change Password",
      "Privacy Policy",
      "Contact Us",
      "Delete Account",
    ];

    return Scaffold(
      body: SafeAreaWrapper(
        scrollable: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔙 Back button with title
            BackButtonWidget(title: "Settings"),
            const SizedBox(height: 20),

            // ⚙️ Settings List
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: settings.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    switch (settings[index]) {
                      case "Change Password":
                        Get.toNamed(Routes.changePassword);
                        break;

                      case "Privacy Policy":
                        Get.toNamed(Routes.privacyPolicy);
                        break;

                      case "Contact Us":
                       Get.toNamed(Routes.contactUs);
                        break;

                      case "Delete Account":
                        Get.toNamed(Routes.deleteAccount);
                        break;

                      default:
                        Get.rawSnackbar(message: "Tapped: ${settings[index]}");
                    }
                  },

                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          settings[index],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

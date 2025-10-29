import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uidesign/core/common/common_text_field.dart';
import '../../controllers/signup_controller.dart';
import '../../core/common/back_button_widget.dart';
import '../../core/common/common_text.dart';
import '../../core/common/custom_button.dart';
import '../../core/common/safe_area_wrapper.dart';
import '../../core/theme/app_colors.dart';
import '../../routes/app_pages.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeAreaWrapper(
        child: Column(
          children: [
            const BackButtonWidget(title: "Notification", fontSize: 18),
            SizedBox(height: 10),
            Row(children: [CommonText("Today", fontWeight: FontWeight.w500)]),
            SizedBox(height: 10),
            _buildNotificationCard(
              icon: Icons.payment,
              title: "Payment Successfully!",
              message:
                  "Lorem ipsum dolor sit amet consectetur. Ultricies tincidunt eleifend vitae.",
            ),
            _buildNotificationCard(
              icon: Icons.local_offer_outlined,
              title: "30% Special Discount!",
              message:
                  "Lorem ipsum dolor sit amet consectetur. Ultricies tincidunt eleifend vitae.",
            ),
            Row(
              children: [CommonText("Yesterday", fontWeight: FontWeight.w500)],
            ),
            _buildNotificationCard(
              icon: Icons.payment,
              title: "Payment Successfully!",
              message:
                  "Lorem ipsum dolor sit amet consectetur. Ultricies tincidunt eleifend vitae.",
            ),
            _buildNotificationCard(
              icon: Icons.credit_card,
              title: "Credit Card added!",
              message:
                  "Lorem ipsum dolor sit amet consectetur. Ultricies tincidunt eleifend vitae.",
            ),
            _buildNotificationCard(
              icon: Icons.account_balance_wallet,
              title: "Added Money wallet Successfully!",
              message:
                  "Lorem ipsum dolor sit amet consectetur. Ultricies tincidunt eleifend vitae.",
            ),
            _buildNotificationCard(
              icon: Icons.local_offer_outlined,
              title: "5% Special Discount!",
              message:
                  "Lorem ipsum dolor sit amet consectetur. Ultricies tincidunt eleifend vitae.",
            ),
            Row(
              children: [
                CommonText("May, 27 2023", fontWeight: FontWeight.w500),
              ],
            ),
            _buildNotificationCard(
              icon: Icons.payment,
              title: "Payment Successfully!",
              message:
                  "Lorem ipsum dolor sit amet consectetur. Ultricies tincidunt eleifend vitae.",
            ),
          ],
        ),
      ),
    );
  }

  /// 🧱 Notification Card Widget
  Widget _buildNotificationCard({
    required IconData icon,
    required String title,
    required String message,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔘 Black circular icon
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.amberAccent, size: 22),
          ),
          const SizedBox(width: 12),

          // 📄 Notification details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(title, fontSize: 16, fontWeight: FontWeight.w600),
                const SizedBox(height: 4),
                CommonText(
                  message,
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

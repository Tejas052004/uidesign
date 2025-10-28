import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/bottom_nav_controller.dart';
import '../theme/app_colors.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.put(BottomNavController());

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Obx(() {
        int selected = controller.selectedIndex.value;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, "Home", 0, selected, controller),
            _buildNavItem(
              Icons.favorite_border,
              "Favourite",
              1,
              selected,
              controller,
            ),
            _buildNavItem(Icons.wallet, "Wallet", 2, selected, controller),
            _buildNavItem(
              Icons.local_offer_outlined,
              "Offer",
              3,
              selected,
              controller,
            ),
            _buildNavItem(
              Icons.menu,
              "Menu",
              4,
              selected,
              controller,
            ),
          ],
        );
      }),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    int index,
    int selected,
    BottomNavController controller,
  ) {
    bool isSelected = selected == index;
    return GestureDetector(
      onTap: () => controller.changeIndex(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? AppColors.primary : Colors.grey),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.primary : Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

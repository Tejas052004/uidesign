import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/bottom_nav_controller.dart';
import '../theme/app_colors.dart';

class CustomBottomNav extends StatelessWidget {
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.find<BottomNavController>();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Obx(() {
        int selected = controller.selectedIndex.value;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, "Home", 0, selected),
            _buildNavItem(Icons.favorite_border, "Favourite", 1, selected),
            _buildNavItem(Icons.wallet, "Wallet", 2, selected),
            _buildNavItem(Icons.local_offer_outlined, "Offer", 3, selected),
            _buildNavItem(Icons.menu, "Menu", 4, selected),
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
  ) {
    bool isSelected = selected == index;
    return GestureDetector(
      onTap: () => onTap(index),
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

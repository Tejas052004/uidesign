import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uidesign/core/common/back_button_widget.dart';
import 'package:uidesign/core/common/common_text.dart';
import 'package:uidesign/core/common/safe_area_wrapper.dart';
import '../../core/theme/app_colors.dart';
import '../../routes/app_pages.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width * 0.75,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
      ),
      child: SafeAreaWrapper(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // BackButtonWidget(),
            const SizedBox(height: 10),

            // 👤 Profile Section
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary, width: 2),
                  ),
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage("assets/images/emoji.png"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary),
                    color: AppColors.lightYellow,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            CommonText(
              "Nate Samson",
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
            CommonText(
              "nate@email.com",
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),

            const SizedBox(height: 10),

            // 📋 Menu Items
            _buildMenuItem(
              icon: Icons.perm_identity_rounded,
              title: "Edit Profile",
              onTap: () {},
            ),
            const Divider(thickness: 1),

            _buildMenuItem(
              icon: Icons.location_on,
              title: "Address",
              onTap: () {
                Get.toNamed(Routes.addressScreen);
              },
            ),
            const Divider(thickness: 1),

            _buildMenuItem(
              icon: Icons.history,
              title: "History",
              onTap: () {
                Get.toNamed(Routes.historyScreen);
              },
            ),
            const Divider(thickness: 1),

            _buildMenuItem(
              icon: Icons.account_box,
              title: "Complain",
              onTap: () {
                Get.toNamed(Routes.complainScreen);
              },
            ),
            const Divider(thickness: 1),

            _buildMenuItem(
              icon: Icons.people_rounded,
              title: "Referral",
              onTap: () {
                Get.toNamed(Routes.referralScreen);
              },
            ),
            Divider(thickness: 1,),
            _buildMenuItem(
              icon: Icons.help_center_outlined,
              title: "About Us",
              onTap: () {
                Get.toNamed(Routes.aboutUsScreen);
              },
            ),
            Divider(thickness: 1,),
            _buildMenuItem(
              icon: Icons.notifications,
              title: "Notification",
              onTap: () {
                Get.toNamed(Routes.notificationScreen);
              },
            ),
            Divider(thickness: 1,),
            _buildMenuItem(
              icon: Icons.settings,
              title: "Settings",
              onTap: () {
                Get.toNamed(Routes.settingScreen);
              },
            ),
            const Divider(thickness: 1),

            _buildMenuItem(
              icon: Icons.help_outline,
              title: "Help and Support",
              onTap: () {
                Get.toNamed(Routes.helpSupport);
              },
            ),
            const Divider(thickness: 1),

            _buildMenuItem(
              icon: Icons.logout,
              title: "Logout",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    Color? color,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      leading: Icon(icon, color: color ?? Colors.black87),
      title: CommonText(
        title,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: color ?? Colors.black87,
      ),
      onTap: onTap,
    );
  }
}

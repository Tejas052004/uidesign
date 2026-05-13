import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uidesign/controllers/bottom_nav_controller.dart';
import 'package:uidesign/core/common/custom_bottom_nav.dart';
import 'package:uidesign/presentation/favourite/favourite_screen.dart';
import 'package:uidesign/presentation/home_screen.dart';
import 'package:uidesign/presentation/offer_screen.dart';
import 'package:uidesign/presentation/wallet/wallet_screen.dart';
import '../routes/app_pages.dart';

class MainScreen extends GetView<BottomNavController> {
  MainScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(),
      FavouriteScreen(),
      const WalletScreen(),
      OfferScreen(),
    ];

    return Obx(() {
      return Scaffold(
        key: scaffoldKey,
        drawerScrimColor: Colors.transparent,
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: screens,
        ),
        bottomNavigationBar: CustomBottomNav(
          onTap: (index) {
            if (index == 4) {
              Get.toNamed(Routes.sideMenu);
            } else {
              controller.changeIndex(index);
            }
          },
        ),
      );
    });
  }
}

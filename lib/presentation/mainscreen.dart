import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uidesign/controllers/bottom_nav_controller.dart';
import 'package:uidesign/core/common/custom_bottom_nav.dart';
import 'package:uidesign/presentation/Menu/side_menu.dart';
import 'package:uidesign/presentation/favourite/favourite_screen.dart';
import 'package:uidesign/presentation/home_screen.dart';
import 'package:uidesign/presentation/offer_screen.dart';
import 'package:uidesign/presentation/wallet/wallet_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final BottomNavController navController = Get.put(BottomNavController());

  // ✅ Only these 4 main tabs (no SideMenu here)
  final List<Widget> screens = [
    HomeScreen(),
    FavouriteScreen(),
    WalletScreen(),
    OfferScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        key: scaffoldKey,

        // ✅ Right-side drawer only
        endDrawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: const SideMenu(),
        ),

        // ✅ Remove overlay color (no purple/black dim)
        drawerScrimColor: Colors.transparent,

        // ✅ Your main body
        body: IndexedStack(
          index: navController.selectedIndex.value,
          children: screens,
        ),

        // ✅ Bottom navigation bar
        bottomNavigationBar: CustomBottomNav(
          currentIndex: navController.selectedIndex.value,
          onTap: (index) {
            if (index == 4) {
              // 👉 Only open drawer, do NOT change index
              scaffoldKey.currentState?.openEndDrawer();
            } else {
              // ✅ Safe index (0–3)
              navController.changeIndex(index);
            }
          },
        ),

      );
    });
  }
}

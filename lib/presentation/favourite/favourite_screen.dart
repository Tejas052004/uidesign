import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controllers/bottom_nav_controller.dart';
import '../../core/common/common_text.dart';
import '../../core/common/custom_bottom_nav.dart';
import '../../core/theme/app_colors.dart';
import '../Menu/side_menu.dart';

class FavouriteScreen extends StatelessWidget {



  final List<Map<String, String>> favourites = const [
    {
      "title": "Office",
      "address": "2972 Westheimer Rd. Santa Ana, Illinois 85486",
    },
    {
      "title": "Home",
      "address": "2972 Westheimer Rd. Santa Ana, Illinois 85486",
    },
    {
      "title": "Office",
      "address": "2972 Westheimer Rd. Santa Ana, Illinois 85486",
    },
    {
      "title": "House",
      "address": "2972 Westheimer Rd. Santa Ana, Illinois 85486",
    },
    {
      "title": "Home",
      "address": "2972 Westheimer Rd. Santa Ana, Illinois 85486",
    },
    {
      "title": "Office",
      "address": "2972 Westheimer Rd. Santa Ana, Illinois 85486",
    },
    {
      "title": "House",
      "address": "2972 Westheimer Rd. Santa Ana, Illinois 85486",
    },
    {
      "title": "House",
      "address": "2972 Westheimer Rd. Santa Ana, Illinois 85486",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // key: navController.scaffoldKey, // connect controller key
      // endDrawer: SizedBox(
      //   width: MediaQuery.of(context).size.width * 0.75, // 75% of screen width
      //   child: const SideMenu(),
      // ),

      // bottomNavigationBar: const CustomBottomNav(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              CommonText(
                "Favourite",
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
              const SizedBox(height: 16),

              // 🔹 Expanded to allow scrolling
              Expanded(
                child: ListView.builder(
                  itemCount: favourites.length,
                  itemBuilder: (context, index) {
                    final item = favourites[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: AppColors.searchScreenSearchBar,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 8),

                          // ✅ Expanded ensures text wraps and avoids overflow
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  item["title"]!,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                const SizedBox(height: 4),
                                CommonText(
                                  item["address"]!,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 8),

                          // 🔹 Delete Icon
                          const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                            size: 22,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

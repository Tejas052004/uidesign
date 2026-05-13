import 'package:flutter/material.dart' hide SearchController;
import 'package:get/get.dart';
import 'package:uidesign/core/common/common_text.dart';
import 'package:uidesign/core/common/safe_area_wrapper.dart';
import '../controllers/search_controller.dart';
import '../core/theme/app_colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchController controller = Get.find<SearchController>();

    return Scaffold(
      body: SafeAreaWrapper(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        scrollable: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search bar
            Container(
              decoration: BoxDecoration(
                color: AppColors.searchScreenSearchBar,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Row(
                  children: [
                    Icon(Icons.location_on_outlined, color: Colors.grey),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    Icon(Icons.close, color: Colors.grey),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            // 🟠 Header Row
            Row(
              children: [
                CommonText(
                  "Recent places",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: controller.clearAll, // 👈 GetX action
                  child: CommonText(
                    "Clear all",
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 🔄 Reactive area
            Expanded(
              child: Obx(() {
                // ✅ if list empty → show image
                if (controller.recentPlaces.isEmpty) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/note-found.png",
                          // 🔹 replace with your image
                          width: 200,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 10),
                        CommonText(
                          "Not Found",
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: CommonText(
                            "Sorry, the keyword you entered cannot be found, please check again or search with another keyword",
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.grey,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                // ✅ else show recent places list
                return ListView.builder(
                  itemCount: controller.recentPlaces.length,
                  itemBuilder: (context, index) {
                    final place = controller.recentPlaces[index];
                    print(place);
                    return _buildRecentPlace(
                      icon: Icons.access_time_outlined,
                      title: place["title"]!,
                      address: place["address"]!,
                      distance: place["distance"]!,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 same _buildRecentPlace method (unchanged)
  Widget _buildRecentPlace({
    required IconData icon,
    required String title,
    required String address,
    required String distance,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.white,
            child: Icon(icon, color: Colors.black),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(title, fontSize: 16, fontWeight: FontWeight.w500),
                const SizedBox(height: 2),
                CommonText(
                  address,
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          CommonText(distance, fontSize: 14, fontWeight: FontWeight.w500),
        ],
      ),
    );
  }
}

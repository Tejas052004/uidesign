import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uidesign/core/common/back_button_widget.dart';
import 'package:uidesign/core/common/common_text.dart';
import 'package:uidesign/core/common/custom_button.dart';
import 'package:uidesign/core/theme/app_colors.dart';

import '../../../core/common/common_text_field.dart';
import '../../../core/common/safe_area_wrapper.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

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
    },{
      "title": "House",
      "address": "2972 Westheimer Rd. Santa Ana, Illinois 85486",
    },{
      "title": "House",
      "address": "2972 Westheimer Rd. Santa Ana, Illinois 85486",
    },{
      "title": "House",
      "address": "2972 Westheimer Rd. Santa Ana, Illinois 85486",
    },{
      "title": "House",
      "address": "2972 Westheimer Rd. Santa Ana, Illinois 85486",
    },{
      "title": "House",
      "address": "2972 Westheimer Rd. Santa Ana, Illinois 85486",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtonWidget(title: "Address"),
              const SizedBox(height: 20),

              // ✅ Expanded fixes RenderBox layout error
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

                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 8),

                          // ✅ Expanded keeps text flexible
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
                          const Icon(Icons.edit, color: Colors.red, size: 22),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: "Add New Address",
                      onPressed: () {
                        _showRideBottomSheet(context);
                      },
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showRideBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // ✅ Allows full height and keyboard adjustment
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        // ✅ Wrap with SingleChildScrollView + padding for keyboard
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(
              context,
            ).viewInsets.bottom, // moves with keyboard
          ),
          child: SafeAreaWrapper(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🔹 Close Icon on Top
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.black),
                    onPressed: () => Get.back(),
                  ),
                ),

                const SizedBox(height: 10),

                CommonText(
                  "Address Details",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),

                const Divider(thickness: 1),
                const SizedBox(height: 30),

                CommonTextField(
                  hintText: "Name of Address",
                  prefixIcon: const Icon(
                    Icons.add_circle_outline,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 20),

                CommonTextField(hintText: "Address Details", maxLines: 4),

                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "Add Address",
                        onPressed: () {},
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

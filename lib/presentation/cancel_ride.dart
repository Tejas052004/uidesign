import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:uidesign/core/common/common_text.dart';
import 'package:uidesign/core/common/common_text_field.dart';
import 'package:uidesign/core/common/custom_button.dart';
import 'package:uidesign/core/common/safe_area_wrapper.dart';
import 'package:uidesign/core/common/back_button_widget.dart';

import '../core/common/custom_dialog.dart';
import '../core/theme/app_colors.dart';
import '../routes/app_pages.dart';

// 🔹 Controller to manage checkbox states
class CancelRideController extends GetxController {
  RxList<bool> isCheckedList = <bool>[].obs;

  void initList(int length) {
    isCheckedList.value = List.generate(length, (_) => false);
  }

  void toggleCheckbox(int index) {
    isCheckedList[index] = !isCheckedList[index];
  }
}

class CancelRide extends StatefulWidget {
  CancelRide({super.key});

  @override
  State<CancelRide> createState() => _CancelRideState();
}

class _CancelRideState extends State<CancelRide> {
  final CancelRideController controller = Get.put(CancelRideController());

  final List<String> reasons = [
    "Waiting for long time",
    "Unable to contact driver",
    "Driver denied to go to destination",
    "Driver denied to come to pickup",
    "Wrong address shown",
    "The price is not reasonable",
  ];

  @override
  void initState() {
    super.initState();
    controller.initList(reasons.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeAreaWrapper(
        child: Column(
          children: [
            BackButtonWidget(title: "Cancel Taxi"),
            SizedBox(height: 20),
            CommonText(
              "Please select the reason of cancellation.",
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: reasons.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  // space between boxes
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFFE0E0E0), // light grey border
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: controller.isCheckedList[index],
                          activeColor: AppColors.primary,
                          onChanged: (value) {
                            controller.toggleCheckbox(index);
                          },
                        ),
                      ),
                      Expanded(
                        child: CommonText(
                          reasons[index],
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            CommonTextField(hintText: "Other", maxLines: 4),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Submit",
                    onPressed: () {
                      Get.dialog(
                        CustomDialog(
                          title: "We're so sad about your cancellation",
                          message:
                              "We will continue to improve our service & satisfy you on the next trip.",
                          imagePath: 'assets/images/emoji.png',
                          buttonText: "Back Home",
                          onPressed: () {
                            Get.offAllNamed(Routes.mainScreen);
                          },
                        ),
                        barrierDismissible: false,
                      );
                    },
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

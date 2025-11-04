import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uidesign/core/common/back_button_widget.dart';
import 'package:uidesign/core/common/custom_button.dart';
import 'package:uidesign/core/common/safe_area_wrapper.dart';
import 'package:uidesign/core/theme/app_colors.dart';

import '../../../controllers/signup_controller.dart';
import '../../../core/common/common_text_field.dart';
import '../../../core/common/custom_dialog.dart';
import '../../../routes/app_pages.dart';

class ComplainScreen extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeAreaWrapper(
        child: Column(
          children: [
            BackButtonWidget(title: "Complain"),
            SizedBox(height: 20),
            Obx(
              () => CommonTextField(
                hintText: "Gender",
                isDropdownField: true,
                dropdownItems: controller.genderList,
                selectedValue: controller.selectedGender.value,
                onDropdownChanged: (value) {
                  controller.selectedGender.value = value ?? '';
                },
              ),
            ),
            SizedBox(height: 20),
            CommonTextField(
              hintText: "Write your complain here (minimum 10 characters)",
              maxLines: 4,
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Submit",
                    onPressed: () {
                      Get.dialog(
                        CustomDialog(
                          title: "Send successful",
                          message: "Your complain has been send successful",
                          imagePath: 'assets/images/Group-6476.png',
                          buttonText: "Back Home",
                          onPressed: () {
                            Get.toNamed(Routes.mainScreen);
                          },
                        ),
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

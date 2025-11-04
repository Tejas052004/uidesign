import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uidesign/core/common/back_button_widget.dart';
import 'package:uidesign/core/common/common_text.dart';
import 'package:uidesign/core/common/common_text_field.dart';
import 'package:uidesign/core/common/custom_button.dart';
import 'package:uidesign/core/common/safe_area_wrapper.dart';

import '../../controllers/signup_controller.dart';
import '../../core/common/custom_dialog.dart';
import '../../core/theme/app_colors.dart';
import '../../routes/app_pages.dart';

class AddAmount extends StatelessWidget {

  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              BackButtonWidget(title: "Amount"),
              SizedBox(height: 20),
              CommonTextField(hintText: "Enter Amount"),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.dialog(
                        CustomDialog(
                          dropdownItems: controller.genderList,
                          selectedValue: controller.selectedGender.value,
                          onDropdownChanged: (value) {
                            controller.selectedGender.value = value ?? '';
                          },
                          hintText: "Gender",
                          secondHintText: "Account Number",
                          buttonText: "Save Payment Method",
                          onPressed: () {
                            Get.toNamed(Routes.addAmount);
                          },
                        ),
                        barrierDismissible: false,
                      );
                    },
                    child: CommonText(
                      "Add payment Method",
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CommonText(
                    "Select Payment Method",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(height: 15),
              Column(
                children: [
                  _buildPaymentCard('assets/images/Payment.png'),
                  _buildPaymentCard('assets/images/Payment-1.png'),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: "Confirm",
                      onPressed: () {
                        Get.dialog(
                          CustomDialog(
                            title: "Add Success",
                            message: "Your money has been add successfully",
                            imagePath: 'assets/images/Group-6476.png',
                            amount: "\$450",
                            buttonText: "Back Home",
                            onPressed: () {
                              Get.toNamed(Routes.mainScreen);
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
      ),
    );
  }

  Widget _buildPaymentCard(String imagePath) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.lightYellow,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.primary),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath, width: 80, height: 50),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CommonText(
                  "**** **** **** 8970",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                SizedBox(height: 4),
                CommonText(
                  "Expires: 12/26",
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

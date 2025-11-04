import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uidesign/core/common/common_text_field.dart';
import '../../controllers/signup_controller.dart';
import '../../core/common/back_button_widget.dart';
import '../../core/common/custom_button.dart';
import '../../core/common/safe_area_wrapper.dart';
import '../../core/theme/app_colors.dart';
import '../../routes/app_pages.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeAreaWrapper(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 🔙 Back button + Title together
            const BackButtonWidget(title: "Profile", fontSize: 18, ),

            const SizedBox(height: 30),

            // 🖼 Profile picture with edit icon
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: const AssetImage(
                      "assets/images/profile_pic.png",
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 👤 Full Name
            CommonTextField(hintText: "Full Name"),

            const SizedBox(height: 16),

            // 📱 Mobile Number
            CommonTextField(
              hintText: "Your Mobile Number",
              isPhoneField: true, // 👈 Enable phone field mode
              onCountryCodeChanged: (code) {
                print("Selected country code: $code");
              },

            ),


            const SizedBox(height: 16),

            // 📧 Email
            CommonTextField(hintText: "Email", keyboardType: TextInputType.emailAddress,),

            const SizedBox(height: 16),

            // 🏠 Street
            CommonTextField(hintText: "Street"),

            const SizedBox(height: 16),

            // 🏙 City Dropdown
            Obx(() => CommonTextField(
              hintText: "City",
              isDropdownField: true,
              dropdownItems: controller.cityList,
              selectedValue: controller.selectedCity.value,
              onDropdownChanged: (value) {
                controller.selectedCity.value = value ?? '';
              },
            )),

            const SizedBox(height: 16),

            // 📍 District Dropdown
            Obx(() => CommonTextField(
              hintText: "District",
              isDropdownField: true,
              dropdownItems: controller.districtList,
              selectedValue: controller.selectedDistrict.value,
              onDropdownChanged: (value) {
                controller.selectedDistrict.value = value ?? '';
              },
            )),

            const SizedBox(height: 20),

            // 🔘 Buttons Row
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Cancel",
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: CustomButton(
                    text: "Save",
                    color: AppColors.primary,
                    onPressed: () {
                      Get.toNamed(Routes.signIn);
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

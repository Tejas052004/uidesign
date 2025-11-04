import 'package:flutter/material.dart';
import 'package:uidesign/core/common/back_button_widget.dart';
import 'package:uidesign/core/common/common_text.dart';
import 'package:uidesign/core/common/common_text_field.dart';
import 'package:uidesign/core/common/custom_button.dart';
import 'package:uidesign/core/common/safe_area_wrapper.dart';
import 'package:uidesign/core/theme/app_colors.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 👇 Fixed AppBar (not scrolling)
              const BackButtonWidget(title: "Contact Us"),

              // 👇 Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      CommonText(
                        "Contact us for Ride share",
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                      const SizedBox(height: 20),

                      CommonText("Address",
                          fontSize: 16, fontWeight: FontWeight.w500),
                      const SizedBox(height: 10),

                      CommonText(
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        "House# 72, Road# 21, Banani, Dhaka-1213 (near Banani Bidyaniketon School & College, beside University of South Asia)",
                      ),

                      const SizedBox(height: 20),
                      CommonText("Call : 13301 (24/7)",
                          fontWeight: FontWeight.w500, fontSize: 12),
                      CommonText("Email : support@pathao.com",
                          fontWeight: FontWeight.w500, fontSize: 12),

                      const SizedBox(height: 30),
                      CommonText(
                        "Send Message",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),

                      const SizedBox(height: 20),
                      const CommonTextField(hintText: "Name"),
                      const SizedBox(height: 15),
                      const CommonTextField(hintText: "Email"),
                      const SizedBox(height: 15),

                      CommonTextField(
                        hintText: "Your Mobile Number",
                        isPhoneField: true,
                        onCountryCodeChanged: (code) {
                          debugPrint("Selected country code: $code");
                        },
                      ),
                      const SizedBox(height: 15),

                      const CommonTextField(
                        hintText: "Write your text",
                        maxLines: 4,
                      ),
                      const SizedBox(height: 30),

                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: "Send Message",
                              onPressed: () {},
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uidesign/core/common/common_text.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:uidesign/controllers/about_us_controller.dart';
import 'package:uidesign/core/common/back_button_widget.dart';
import 'package:uidesign/core/common/safe_area_wrapper.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AboutUsController());

    return Scaffold(
      body: SafeAreaWrapper(
        scrollable: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonWidget(title: "Privacy Policy"),
            const SizedBox(height: 10),
            CommonText(
              "Privacy Policy for Ride share",
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            Expanded(
              child: Stack(
                children: [
                  WebViewWidget(controller: controller.webViewController),
                  Obx(
                    () => controller.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

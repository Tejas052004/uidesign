import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:uidesign/controllers/web_view_controller.dart';
import 'package:uidesign/core/common/back_button_widget.dart';
import 'package:uidesign/core/common/safe_area_wrapper.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const url = "https://dsinfoway.com/";
    final controller = Get.put(CustomWebViewController(url), tag: url);

    return Scaffold(
      body: SafeAreaWrapper(
        scrollable: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonWidget(title: "About Us"),
            const SizedBox(height: 10),
            Expanded(
              child: Stack(
                children: [
                  WebViewWidget(controller: controller.webViewController),
                  Obx(() => controller.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : const SizedBox()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

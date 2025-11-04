import 'dart:ui';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutUsController extends GetxController {
  late final WebViewController webViewController;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => isLoading.value = true,
          onPageFinished: (_) => isLoading.value = false,
        ),
      )
    // 👇 Replace this with your About Us page URL
      ..loadRequest(Uri.parse("https://dsinfoway.com/"));
  }
}

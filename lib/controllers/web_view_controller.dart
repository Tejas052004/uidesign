import 'dart:ui';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../core/base/base_controller.dart';

class CustomWebViewController extends BaseController {
  late final WebViewController webViewController;
  final String url;

  CustomWebViewController(this.url);

  @override
  void onInit() {
    super.onInit();
    
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => showLoading(),
          onPageFinished: (_) => hideLoading(),
          onWebResourceError: (error) {
            showError("Failed to load page: ${error.description}");
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }
}

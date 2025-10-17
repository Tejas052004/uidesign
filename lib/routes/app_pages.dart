import 'package:get/get.dart';
import 'package:uidesign/presentation/signupScreen.dart';
import 'package:uidesign/presentation/welcome_screen.dart';

import '../presentation/screen1.dart';
import '../presentation/screen2.dart';
import '../presentation/screen3.dart';
import '../presentation/splash/splashscreen.dart';

class Routes {
  static const splash = '/';
  static const screen1 = '/screen1';
  static const screen2 = '/screen2';
  static const screen3 = '/screen3';
  static const welcomeScreen = '/welcomeScreen';
  static const signupScreen = '/signupScreen';
}

class AppPages {
  static final pages = [
    GetPage(name: Routes.splash, page: () => const SplashScreen()),
    GetPage(name: Routes.screen1, page: () => Screen1()),
    GetPage(name: Routes.screen2, page: () => Screen2()),
    GetPage(name: Routes.screen3, page: () => Screen3()),
    GetPage(name: Routes.welcomeScreen, page: () => WelcomeScreen()),
    GetPage(name: Routes.signupScreen, page: () => SignUpScreen()),
  ];
}

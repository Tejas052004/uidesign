import 'package:get/get.dart';
import 'package:uidesign/presentation/forget_password.dart';
import 'package:uidesign/presentation/phone_verify_otp.dart';
import 'package:uidesign/presentation/profile/profile_page.dart';
import 'package:uidesign/presentation/set_new_password.dart';
import 'package:uidesign/presentation/set_password.dart';
import 'package:uidesign/presentation/verify_otp.dart';
import 'package:uidesign/presentation/signupScreen.dart';
import 'package:uidesign/presentation/welcome_screen.dart';

import '../presentation/home_screen.dart';
import '../presentation/screen1.dart';
import '../presentation/screen2.dart';
import '../presentation/screen3.dart';
import '../presentation/send_verification.dart';
import '../presentation/sign_in.dart';
import '../presentation/splash/splashscreen.dart';

class Routes {
  static const splash = '/';
  static const screen1 = '/screen1';
  static const screen2 = '/screen2';
  static const screen3 = '/screen3';
  static const welcomeScreen = '/welcomeScreen';
  static const signupScreen = '/signupScreen';
  static const verifyOtp = '/verifyOtp';
  static const setPassword = '/setPassword';
  static const profilePage = '/profilePage';
  static const signIn = '/signIn';
  static const sendVerification = '/sendVerification';
  static const forgetPassword = '/forgetPassword';
  static const phoneVerifyOtp = '/phoneVerifyOtp';
  static const setNewPassword = '/setNewPassword';
  static const homeScreen = '/homeScreen';
}

class AppPages {
  static final pages = [
    GetPage(name: Routes.splash, page: () => const SplashScreen()),
    GetPage(name: Routes.screen1, page: () => Screen1()),
    GetPage(name: Routes.screen2, page: () => Screen2()),
    GetPage(name: Routes.screen3, page: () => Screen3()),
    GetPage(name: Routes.welcomeScreen, page: () => WelcomeScreen()),
    GetPage(name: Routes.signupScreen, page: () => SignUpScreen()),
    GetPage(name: Routes.verifyOtp, page: () => VerifyOtp()),
    GetPage(name: Routes.setPassword, page: () => SetPassword()),
    GetPage(name: Routes.profilePage, page: () => ProfilePage()),
    GetPage(name: Routes.signIn, page: () => SignIn()),
    GetPage(name: Routes.sendVerification, page: () => SendVerification()),
    GetPage(name: Routes.forgetPassword, page: () => ForgetPassword()),
    GetPage(name: Routes.phoneVerifyOtp, page: () => PhoneVerifyOtp()),
    GetPage(name: Routes.setNewPassword, page: () => SetNewPassword()),
    GetPage(name: Routes.homeScreen, page: () => HomeScreen()),
  ];
}

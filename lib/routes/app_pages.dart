import 'package:get/get.dart';
import 'package:uidesign/presentation/all_payment_method.dart';
import 'package:uidesign/presentation/available_cars.dart';
import 'package:uidesign/presentation/car_details.dart';
import 'package:uidesign/presentation/forget_password.dart';
import 'package:uidesign/presentation/notification/notification_screen.dart';
import 'package:uidesign/presentation/phone_verify_otp.dart';
import 'package:uidesign/presentation/profile/profile_page.dart';
import 'package:uidesign/presentation/request_rent.dart';
import 'package:uidesign/presentation/search_screen.dart';
import 'package:uidesign/presentation/set_new_password.dart';
import 'package:uidesign/presentation/set_password.dart';
import 'package:uidesign/presentation/transport_screen.dart';
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
  static const searchScreen = '/searchScreen';
  static const notificationScreen = '/notificationScreen';
  static const transportScreen = '/transportScreen';
  static const availableCars = '/availableCars';
  static const carDetail = '/carDetail';
  static const requestRent = '/requestRent';
  static const allPaymentMethod = '/allPaymentMethod';
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
    GetPage(name: Routes.searchScreen, page: () => SearchScreen()),
    GetPage(name: Routes.notificationScreen, page: () => NotificationScreen()),
    GetPage(name: Routes.transportScreen, page: () => TransportScreen()),
    GetPage(name: Routes.availableCars, page: () => AvailableCars()),
    GetPage(name: Routes.carDetail, page: () => CarDetails()),
    GetPage(name: Routes.requestRent, page: () => RequestRent()),
    GetPage(name: Routes.allPaymentMethod, page: () => AllPaymentMethod()),
  ];
}

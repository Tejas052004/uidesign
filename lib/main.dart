import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/bottom_nav_controller.dart';
import 'routes/app_pages.dart';

void main() {
  runApp(const MyApp());

  // ✅ અહીં register કરો
  Get.put(BottomNavController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clean Arch App',
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      initialRoute: Routes.splash, // 👈 GetX route
      getPages: AppPages.pages, // 👈 route list
    );
  }
}

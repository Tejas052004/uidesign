import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uidesign/core/common/common_text.dart';
import 'package:uidesign/core/common/transport_card.dart';
import '../../core/common/back_button_widget.dart';
import '../../core/theme/app_colors.dart';
import '../routes/app_pages.dart';

class AvailableCars extends StatefulWidget {
  const AvailableCars({super.key});

  @override
  State<AvailableCars> createState() => _AvailableCarsState();
}

class _AvailableCarsState extends State<AvailableCars> {
  int selectedIndex = -1;

  final List<Map<String, String>> cars = [
    {
      "name": "BMW Cabrio",
      "type": "Automatic",
      "seats": "3",
      "fuel": "Octane",
      "distance": "800m",
      "time": "5mins",
      "image": "assets/images/Car.png",
    },
    {
      "name": "Mustang Shelby GT",
      "type": "Automatic",
      "seats": "3",
      "fuel": "Octane",
      "distance": "800m",
      "time": "5mins",
      "image": "assets/images/Car.png",
    },
    {
      "name": "BMW i8",
      "type": "Automatic",
      "seats": "3",
      "fuel": "Octane",
      "distance": "800m",
      "time": "5mins",
      "image": "assets/images/Car.png",
    },
    {
      "name": "Jaguar Silber",
      "type": "Automatic",
      "seats": "3",
      "fuel": "Octane",
      "distance": "800m",
      "time": "5mins",
      "image": "assets/images/Car.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButtonWidget(),
              
              const SizedBox(height: 10),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText("Available cars for ride", fontWeight: FontWeight.w600, fontSize: 24,),
                  CommonText("18 cars found", color: Colors.grey, fontWeight: FontWeight.w500,)
                ],
              ),

              SizedBox(height: 10,),

              Expanded(
                child: ListView.builder(
                  itemCount: cars.length,
                  itemBuilder: (context, index) {
                    final car = cars[index];
                    return TransPortCard(
                      name: car["name"]!,
                      type: car["type"]!,
                      seats: car["seats"]!,
                      fuel: car["fuel"]!,
                      distance: car["distance"]!,
                      time: car["time"]!,
                      image: car["image"]!,
                      isSelected: selectedIndex == index,
                      onTap: () {
                        Get.toNamed(Routes.carDetail);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

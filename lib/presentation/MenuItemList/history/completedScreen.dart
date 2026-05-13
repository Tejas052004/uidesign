import 'package:flutter/material.dart';
import '../../../core/common/common_text.dart';
import '../../../core/theme/app_colors.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key});

  final List<Map<String, String>> transactions = const [
    {
      "name": "Nate",
      "title": "Mustang Shelby GT",
      "time": "Today at 09:20 am456",
    },
    {
      "name": "Henry",
      "title": "Mustang Shelby GT",
      "time": "Today at 10:20 am",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final item = transactions[index];

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.primary, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(item["name"]!, fontWeight: FontWeight.w500),
                  const SizedBox(height: 3),
                  CommonText(
                    item["title"]!,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ],
              ),
              CommonText(
                item["time"]!,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ],
          ),
        );
      },
    );
  }
}

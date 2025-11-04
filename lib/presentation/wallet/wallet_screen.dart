import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uidesign/core/common/custom_button.dart';
import 'package:uidesign/core/common/safe_area_wrapper.dart';
import 'package:uidesign/core/theme/app_colors.dart';
import '../../core/common/common_text.dart';
import '../../routes/app_pages.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  final List<Map<String, dynamic>> transactions = const [
    {
      "name": "Welton",
      "time": "Today at 09:20 am",
      "amount": "-\$570.00",
      "isDebit": true,
    },
    {
      "name": "Sarah",
      "time": "Yesterday at 05:45 pm",
      "amount": "+\$250.00",
      "isDebit": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeAreaWrapper(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Add Money button aligned to right
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 150,
                    child: CustomButton(
                      text: "Add Money",
                      onPressed: () {
                        Get.toNamed(Routes.addAmount);
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // 🔹 Wallet summary boxes
              Row(
                children: [
                  // Available Balance
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.lightYellow,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: AppColors.primary, width: 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CommonText(
                            "\$500",
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: 6),
                          CommonText(
                            "Available Balance",
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Total Expend
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFBEA),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.primary, width: 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CommonText(
                            "\$200",
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: 6),
                          CommonText(
                            "Total Expend",
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // 🔹 Transactions Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    "Transactions",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  CommonText(
                    "See All",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // 🔹 Transactions List (new design)
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final item = transactions[index];
                  final bool isDebit = item["isDebit"];

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.primary, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 🔹 Left side
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: isDebit
                                    ? Colors.red.withOpacity(0.15)
                                    : Colors.green.withOpacity(0.15),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                isDebit
                                    ? Icons.call_made
                                    : Icons.call_received,
                                color: isDebit ? Colors.red : Colors.green,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 12),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  item["name"],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                                const SizedBox(height: 3),
                                CommonText(
                                  item["time"],
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),

                        // 🔹 Right side (Amount)
                        CommonText(
                          item["amount"],
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

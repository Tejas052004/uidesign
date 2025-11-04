import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uidesign/core/common/back_button_widget.dart';
import 'package:uidesign/core/common/common_text.dart';
import 'package:uidesign/core/common/custom_button.dart';
import 'package:uidesign/core/common/safe_area_wrapper.dart';
import 'package:uidesign/core/theme/app_colors.dart';

import '../../../core/common/common_text_field.dart';
import '../../../core/common/custom_dialog.dart';

class ReferralScreen extends StatelessWidget {
  const ReferralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeAreaWrapper(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonWidget(title: "Referral"),
            SizedBox(height: 20),
            CommonText("Refer a friend and Earn \$20"),
            SizedBox(height: 10),
            CommonTextField(
              hintText: "a",
              suffixIcon: Icon(Icons.copy_rounded),
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Expanded(
                  child: CustomButton(text: "Invite", onPressed: (){}, color: AppColors.primary,),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

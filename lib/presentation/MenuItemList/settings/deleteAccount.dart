import 'package:flutter/material.dart';
import 'package:uidesign/core/common/back_button_widget.dart';
import 'package:uidesign/core/common/common_text.dart';
import 'package:uidesign/core/common/common_text_field.dart';
import 'package:uidesign/core/common/custom_button.dart';
import 'package:uidesign/core/common/safe_area_wrapper.dart';

import '../../../core/theme/app_colors.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeAreaWrapper(
        child: Column(
          children: [
            BackButtonWidget(title: "Delete Account"),
            SizedBox(height: 30),
            CommonText(
              "Are you sure you want to delete your account? Please read how account deletion will affect. Deleting your account removes personal information our database. Tour email becomes permanently reserved and same email cannot be re-use to register a new account.",
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Expanded(child: CustomButton(text: "Delete", onPressed: (){}, color: AppColors.primary,)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

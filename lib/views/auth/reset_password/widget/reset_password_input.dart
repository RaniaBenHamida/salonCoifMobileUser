import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/utils/dimensions.dart';
import '../../../../base/utils/size.dart';
import '../../../../base/widgets/primary_input_widget.dart';
import '../../../../languages/strings.dart';
import '../controller/reset_password_controller.dart';

class ResetPasswordInputWidget extends GetView<ResetPasswordController> {
  const ResetPasswordInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.verticalSize,
        ),
        child: Column(
          children: [
            PrimaryInputWidget(
              controller: controller.newPasswordController,
              label: Strings.newPassword,
              hintText: Strings.newPassword,
              isPasswordField: true,
            ),
            Sizes.height.betweenInputBox,
            PrimaryInputWidget(
              controller: controller.confirmPasswordController,
              label: Strings.confirmPassword,
              hintText: Strings.confirmPassword,
              isPasswordField: true,
            ),
          ],
        ),
      ),
    );
  }
}

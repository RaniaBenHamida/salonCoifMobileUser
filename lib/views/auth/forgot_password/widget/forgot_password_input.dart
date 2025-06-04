import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beautyTn/views/auth/forgot_password/controller/forgot_password_controller.dart';

import '../../../../base/utils/basic_import.dart';

class ForgotPasswordInput extends StatelessWidget {
  ForgotPasswordInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgotPasswordController>();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultHorizontalSize,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.verticalSize,
            ),
            child: PrimaryInputWidget(
              controller: controller.emailAddressController,
              label: Strings.emailAddress,
              hintText: Strings.emailAddress,
              textInputType: TextInputType.emailAddress,
              showBorderSide: true,
            ),
          ),
          _buttonWidget(context),
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    final controller = Get.find<ForgotPasswordController>();

    return Obx(
      () => PrimaryButton(
        title: Strings.sendOtp,
        disable: !controller.isFormValid.value,
        isLoading: controller.isLoading,
        onPressed: () {
          if (controller.isFormValid.value) {
            controller.onForgotPassword;
          }
        },
      ),
    );
  }
}

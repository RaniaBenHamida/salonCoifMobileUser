import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/widgets/primary_button.dart';
import '../../../../languages/strings.dart';
import '../controller/otp_verification_controller.dart';

class OtpSubmitButton extends GetView<OtpVerificationController> {
  const OtpSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PrimaryButton(
        title: Strings.submit,
        disable: !controller.isFormValid.value,
        isLoading: controller.isLoading,
        onPressed: () {
          // Routes.resetPasswordScreen.toNamed;
          if (controller.isFormValid.value) {
            controller.onOtpSubmit;
          }
        },
      ),
    );
  }
}

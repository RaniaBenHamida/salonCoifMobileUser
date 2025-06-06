import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../base/widgets/primary_button.dart';
import '../../../../languages/strings.dart';
import '../controller/two_fa_verification_screen_controller.dart';

class TwoFaOtpSubmitButton extends GetView<TwoFaVerificationScreenController> {
  const TwoFaOtpSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PrimaryButton(
        title: Strings.submit,
        disable: !controller.isFormValid.value,
        isLoading: controller.isLoading,
        onPressed: () {
          if (controller.isFormValid.value) {
            controller.onOtpSubmit;
          }
        },
      ),
    );
  }
}

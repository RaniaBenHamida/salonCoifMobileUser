import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/widgets/added/otp_input_field.dart';
import '../controller/otp_verification_controller.dart';


class ResetOtpInputField extends GetView<OtpVerificationController> {
  const ResetOtpInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return OtpInputField(
      controller: controller.otpController,
    );
  }
}

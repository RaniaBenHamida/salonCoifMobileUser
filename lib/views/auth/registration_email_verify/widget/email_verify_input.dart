import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/widgets/added/otp_input_field.dart';
import '../controller/registration_email_verify_controller.dart';

class EmailVerifyInputField extends GetView<RegistrationEmailVerifyController> {
  const EmailVerifyInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return OtpInputField(
      controller: controller.otpController,
    );
  }
}

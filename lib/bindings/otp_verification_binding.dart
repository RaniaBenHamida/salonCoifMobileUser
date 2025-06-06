import 'package:get/get.dart';

import '../views/auth/otp_verification/controller/otp_verification_controller.dart';
import '../views/auth/reset_password/controller/reset_password_controller.dart';


class OtpVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OtpVerificationController());
    Get.put(ResetPasswordController());
  }
}

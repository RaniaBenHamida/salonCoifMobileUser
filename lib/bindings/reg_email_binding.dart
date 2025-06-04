import 'package:get/get.dart';

import '../views/auth/registration_email_verify/controller/registration_email_verify_controller.dart';

class RegistrationEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegistrationEmailVerifyController());
  }
}

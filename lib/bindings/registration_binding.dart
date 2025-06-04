import 'package:get/get.dart';

import '../views/auth/registration/controller/registration_controller.dart';

class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationController());
  }
}

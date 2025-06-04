import 'package:get/get.dart';

import '../views/auth/login/controller/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LogInController());
  }
}

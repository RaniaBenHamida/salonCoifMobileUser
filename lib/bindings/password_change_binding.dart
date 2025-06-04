import 'package:get/get.dart';
import 'package:beautyTn/views/change_password/controller/change_password_controller.dart';

class PasswordChangeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController());
  }
}

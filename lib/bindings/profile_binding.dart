import 'package:get/get.dart';
import '../views/profile/controller/profile_controller.dart';
import '../views/update_profile/controller/update_profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => UpdateProfileController());
    // Get.put(UpdateProfileController());
  }
}

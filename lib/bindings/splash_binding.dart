import 'package:get/get.dart';

import '../views/onboard/controller/onboard_controller.dart';
import '../views/splash/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(OnboardController());
  }
}

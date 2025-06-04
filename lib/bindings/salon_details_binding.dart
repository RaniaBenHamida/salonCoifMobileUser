import 'package:get/get.dart';
import '../views/salon_details/controller/salon_details_controller.dart';

class SalonDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SalonDetailsController());
  }
}

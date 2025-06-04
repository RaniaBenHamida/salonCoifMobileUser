import 'package:get/get.dart';
import '../views/services/controller/services_controller.dart';

class ServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServicesController());
  }
}

import 'package:get/get.dart';
import '../views/location_permission/controller/location_permission_controller.dart';

class LocationPermissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationPermissionController());
  }
}

import 'package:get/get.dart';
import '../views/bookings/controller/bookings_controller.dart';
import '../views/dashboard/controller/dashboard_controller.dart';
import '../views/find/controller/find_controller.dart';
import '../views/navigation/controller/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => FindController());
    Get.lazyPut(() => BookingsController());
  }
}

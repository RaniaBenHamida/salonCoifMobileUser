import 'package:get/get.dart';
import '../views/booking_detail/controller/booking_detail_controller.dart';

class BookingDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookingDetailController());
  }
}

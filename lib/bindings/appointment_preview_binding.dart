import 'package:get/get.dart';
import '../views/appointment_preview/controller/appointment_preview_controller.dart';

class AppointmentPreviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppointmentPreviewController());
  }
}

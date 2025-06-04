import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beautyTn/base/utils/loader.dart';
import 'package:beautyTn/base/widgets/added/custom_dialog_widget.dart';
import '../../../base/utils/basic_import.dart';
import '../../../base/widgets/added/icon_text_widget.dart';
import '../../../base/widgets/double_side_text_widget.dart';
import '../controller/appointment_preview_controller.dart';
part 'appointment_preview_tablet_screen.dart';
part 'appointment_preview_mobile_screen.dart';
part '../widget/preview.dart';
part '../widget/payment_method.dart';
part '../widget/button.dart';

class AppointmentPreviewScreen extends GetView<AppointmentPreviewController> {
  const AppointmentPreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: AppointmentPreviewMobileScreen(),
      tablet: AppointmentPreviewTabletScreen(),
    );
  }
}

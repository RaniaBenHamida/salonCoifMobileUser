import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../base/utils/basic_import.dart';
import '../../../base/utils/loader.dart';
import '../../salon_details/controller/salon_details_controller.dart';
import '../controller/schedule_controller.dart';
part 'schedule_tablet_screen.dart';
part 'schedule_mobile_screen.dart';
part '../widget/checkout_button.dart';
part '../widget/schedule.dart';
class ScheduleScreen extends GetView<SalonDetailsController> {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: ScheduleMobileScreen(),
      tablet: ScheduleTabletScreen(),
    );
  }
}


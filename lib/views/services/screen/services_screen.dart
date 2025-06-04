import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../base/utils/basic_import.dart';
import '../../../base/widgets/added/custom_cached_image_widget.dart';
import '../../dashboard/controller/dashboard_controller.dart';
import '../controller/services_controller.dart';
part 'services_tablet_screen.dart';
part 'services_mobile_screen.dart';

class ServicesScreen extends GetView<ServicesController> {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: ServicesMobileScreen(),
      tablet: ServicesTabletScreen(),
    );
  }
}

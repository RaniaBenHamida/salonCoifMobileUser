import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../base/utils/basic_import.dart';
import '../../../base/widgets/title_sub_title_widget.dart';
import '../../../routes/routes.dart';
import '../controller/location_permission_controller.dart';
part 'location_permission_tablet_screen.dart';
part 'location_permission_mobile_screen.dart';

class LocationPermissionScreen extends GetView<LocationPermissionController> {
  const LocationPermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: LocationPermissionMobileScreen(),
      tablet: LocationPermissionTabletScreen(),
    );
  }
}

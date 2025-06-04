import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:beautyTn/base/utils/no_data_widget.dart';
import 'package:beautyTn/views/navigation/controller/navigation_controller.dart';

import '../../../base/utils/basic_import.dart';
import '../../../base/utils/loader.dart';
import '../../../base/widgets/added/custom_cached_image_widget.dart';
import '../../../routes/routes.dart';
import '../controller/dashboard_controller.dart';
import '../model/parlour_info_model.dart';

part 'dashboard_mobile_screen.dart';
part 'dashboard_tablet_screen.dart';
part '../widget/location_select.dart';
part '../widget/change_location.dart';
part '../widget/search_bar.dart';
part '../widget/banner_widget.dart';
part '../widget/services.dart';
part '../widget/dashboard_appbar.dart';
part '../widget/salon_service.dart';
part '../widget/salon_info.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: DashboardMobileScreen(),
      tablet: DashboardTabletScreen(),
    );
  }
}
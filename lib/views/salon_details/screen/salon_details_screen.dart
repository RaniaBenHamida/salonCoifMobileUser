import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beautyTn/base/utils/loader.dart';
import 'package:beautyTn/base/widgets/double_side_text_widget.dart';
import 'package:beautyTn/routes/routes.dart';
import 'package:beautyTn/views/dashboard/controller/dashboard_controller.dart';
import '../../../base/utils/basic_import.dart';
import '../../../base/widgets/added/custom_cached_image_widget.dart';
import '../../../base/widgets/added/icon_text_widget.dart';
import '../controller/salon_details_controller.dart';
part 'salon_details_tablet_screen.dart';
part 'salon_details_mobile_screen.dart';
part '../widget/back_button_widget.dart';
part '../widget/main_page.dart';
part '../widget/salon_image.dart';
part '../widget/details.dart';
part '../widget/service.dart';

class SalonDetailsScreen extends GetView<SalonDetailsController> {
  const SalonDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: SalonDetailsMobileScreen(),
      tablet: SalonDetailsTabletScreen(),
    );
  }
}



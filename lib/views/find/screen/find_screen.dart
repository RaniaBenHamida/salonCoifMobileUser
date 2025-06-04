import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beautyTn/views/dashboard/controller/dashboard_controller.dart';
import '../../../base/utils/basic_import.dart';
import '../../../base/utils/loader.dart';
import '../../../base/utils/no_data_widget.dart';
import '../../../base/widgets/added/custom_cached_image_widget.dart';
import '../../../routes/routes.dart';
import '../../dashboard/screen/dashboard_screen.dart';
import '../controller/find_controller.dart';
part 'find_tablet_screen.dart';
part 'find_mobile_screen.dart';
part '../widget/search_bar.dart';
part '../widget/salon_service.dart';

class FindScreen extends GetView<FindController> {
  const FindScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: FindMobileScreen(),
      tablet: FindTabletScreen(),
    );
  }
}

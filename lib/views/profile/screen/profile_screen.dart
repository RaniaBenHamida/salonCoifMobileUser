import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beautyTn/base/api/endpoint/api_endpoint.dart';
import 'package:beautyTn/base/utils/loader.dart';
import 'package:beautyTn/views/navigation/controller/navigation_controller.dart';
import '../../../base/utils/basic_import.dart';
import '../../../base/widgets/added/custom_dialog_widget.dart';
import '../../../base/widgets/added/custom_tiles.dart';
import '../../../routes/routes.dart';
import '../../auth/login/controller/login_controller.dart';
import '../../flutter_web_screen.dart';
import '../../update_profile/controller/update_profile_controller.dart';
import '../controller/profile_controller.dart';
part 'profile_tablet_screen.dart';
part 'profile_mobile_screen.dart';
part '../widget/nav_profile_widget.dart';
part '../widget/buttons.dart';
part '../widget/list_tiles.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: ProfileMobileScreen(),
      tablet: ProfileTabletScreen(),
    );
  }
}

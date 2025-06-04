import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../base/utils/basic_import.dart';
import '../controller/reset_password_controller.dart';
import '../widget/reset_password_headline.dart';
import '../widget/reset_password_input.dart';
import '../widget/reset_password_submit_button.dart';

part 'reset_password_mobile_screen.dart';
part 'reset_password_tablet_screen.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController> {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: ResetPasswordMobileScreen(),
      tablet: ResetPasswordTabletScreen(),
    );
  }
}

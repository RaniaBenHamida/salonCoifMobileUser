import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/utils/basic_import.dart';
import '../../../routes/routes.dart';
import 'setup_method_model.dart';

class SettingsController extends GetxController {
  final List<SetupMethodModel> menuItems = [
    // SetupMethodModel(
    //   title: Strings.kycVerification,
    //   description: "Strings.pleaseSubmitYour",
    //   icon: Icons.admin_panel_settings,
    //   onTap: () {
    //     // Routes.kycInformationScreen.toNamed;
    //   },
    // ),
    SetupMethodModel(
      title: Strings.toFaSecurity,
      description: "",
      icon: Icons.lock_rounded,
      onTap: () {
        Routes.twoFaScreen.toNamed;
      },
    ),
    SetupMethodModel(
      title: Strings.changePassword,
      description: '',
      icon: Icons.key_rounded,
      onTap: () {
        Routes.changePasswordScreen.toNamed;
      },
    ),
    // SetupMethodModel(
    //   title: Strings.themeMode,
    //   description: '',
    //   icon: Icons.dark_mode_outlined,
    //   onTap: () {
    //
    //     Themes().switchTheme();
    //
    //   },
    // ),
  ];
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beautyTn/base/utils/basic_import.dart';

import '../../../../base/api/services/auth_services.dart';
import '../../../../routes/routes.dart';

class RegistrationController extends GetxController {
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  RxBool agree = false.obs;


  // Routing
  get onRegistration => registrationProcess();
  get onLogIn => Routes.loginScreen.toNamed;
  get onPrivacyPolicy => '';
  RxBool isFormValid = false.obs;

  @override
  void onInit() {
    emailAddressController.addListener(_updateFormValidity);
    passwordController.addListener(_updateFormValidity);
    firstNameController.addListener(_updateFormValidity);
    lastNameController.addListener(_updateFormValidity);
    // BasicServices.getBasicSettingsInfo();
    super.onInit();
  }

  void _updateFormValidity() {
    isFormValid.value = emailAddressController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty;
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  registrationProcess() async {
    return AuthServices.registrationProcess(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailAddressController.text,
      password: passwordController.text,
      isLoading: _isLoading,
    );
  }
}

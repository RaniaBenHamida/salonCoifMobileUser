import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beautyTn/base/extensions/extensions.dart';

import '../../../../base/api/services/basic_services.dart';
import '../../../../base/utils/dimensions.dart';
import '../../../../base/widgets/custom_snackbar.dart';
import '../../../../base/widgets/primary_button.dart';
import '../../../../languages/strings.dart';
import '../controller/registration_controller.dart';

class RegButton extends GetView<RegistrationController> {
  const RegButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: Dimensions.verticalSize.edgeVertical * 0.7,
        child: PrimaryButton(
          disable: !controller.isFormValid.value,
          title: Strings.registerNow,
          isLoading: controller.isLoading,
          onPressed: () {
            if (controller.isFormValid.value) {
              if (BasicServices.agreePolicy.value == 1) {
                if (controller.agree.value) {
                  controller.onRegistration;
                } else {
                  if(BasicServices.basicSettingsModel.data.basicSettings.agreePolicy == 0){
                    controller.onRegistration;
                  }else {
                    CustomSnackBar.error(Strings.agreeToTerms);
                  }
                }
              } else {
                controller.onRegistration;
              }
            }
          },
        ),
      ),
    );
  }
}

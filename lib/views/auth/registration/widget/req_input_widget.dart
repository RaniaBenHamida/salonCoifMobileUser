import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/utils/size.dart';
import '../../../../base/widgets/primary_input_widget.dart';
import '../../../../languages/strings.dart';
import '../controller/registration_controller.dart';

class RegInputWidget extends GetView<RegistrationController> {
  const RegInputWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Sizes.height.betweenInputBox,
          Row(
            children: [
              Expanded(
                child: PrimaryInputWidget(
                  controller: controller.firstNameController,
                  label: Strings.firstName,
                  hintText: Strings.name,
                  textInputType: TextInputType.text,
                ),
              ),
              Sizes.width.v15,
              Expanded(
                child: PrimaryInputWidget(
                  controller: controller.lastNameController,
                  label: Strings.lastName,
                  hintText: Strings.name,
                  textInputType: TextInputType.text,
                ),
              ),
            ],
          ),
          Sizes.height.betweenInputBox,
          PrimaryInputWidget(
            controller: controller.emailAddressController,
            label: Strings.emailAddress,
            hintText: Strings.emailAddress,
            textInputType: TextInputType.emailAddress,
          ),
          Sizes.height.betweenInputBox,
          PrimaryInputWidget(
            controller: controller.passwordController,
            label: Strings.password,
            hintText: Strings.password,
            textInputType: TextInputType.text,
            isPasswordField: true,
          ),
        ],
    );
  }
}

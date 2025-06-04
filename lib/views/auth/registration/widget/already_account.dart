import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/utils/basic_import.dart';
import '../controller/registration_controller.dart';

class AlreadyAccountWidget extends GetView<RegistrationController> {
  const AlreadyAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: mainCenter,
          children: [
            TextWidget(
              Strings.alreadyHaveAn,
              colorShade: ColorShade.mediumForty,
              typographyStyle: TypographyStyle.labelMedium,
              padding: Dimensions.horizontalSize.edgeHorizontal * 0.07,
            ),
            TextWidget(
              Strings.logInNow,
              colorShade: ColorShade.mediumForty,
              typographyStyle: TypographyStyle.labelMedium,
              color: CustomColor.primary,
              onTap: () {
                controller.onLogIn;
              },
            ),
          ],
        ),
        Sizes.height.v10,
      ],
    );
  }
}

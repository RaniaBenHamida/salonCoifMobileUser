import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beautyTn/views/auth/login/controller/login_controller.dart';

import '../../../../base/utils/basic_import.dart';
import '../../../base/utils/loader.dart';
import '../../../base/widgets/added/card_type_widget.dart';
import '../../../base/widgets/added/custom_dialog_widget.dart';

class DeleteAccountWidget extends StatelessWidget {
  const DeleteAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LogInController>();
    return Obx(() => controller.isLoading
        ? Loader()
        : CardTypeWidget(
            title: Strings.deleteAccount,
            description: '',
            icon: Icons.delete,
            isDeleteAccount: true,
            onTap: () {

              CustomDialog.open(
                  context: context,
                  onConfirm: () {
                    Get.close(1);
                    controller.deleteAccountProcess();
                  },
                  title: Strings.deleteAccount,
                  subTitle: Strings.deleteAccountSubTitle);
            },
          ));
  }
}

/*

        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(Dimensions.radius * 1.5),
            ),
          ),
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(Dimensions.radius * 1.5)),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.horizontalSize,
                vertical: Dimensions.verticalSize * 0.5,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: Dimensions.widthSize * 4.2,
                      height: Dimensions.heightSize * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Sizes.height.v20,
                  TextWidget(
                    Strings.deleteAccount,
                    typographyStyle: TypographyStyle.titleSmall,
                    fontWeight: FontWeight.bold,
                    padding: EdgeInsets.only(
                      bottom: Dimensions.verticalSize * 0.15,
                    ),
                  ),
                  TextWidget(
                    Strings.deleteAccountSubTitle,
                    typographyStyle: TypographyStyle.bodyMedium,
                  ),
                  Sizes.height.betweenInputBox,
                  PrimaryButton(
                    title: Strings.cancel,
                    onPressed: () {
                      Get.close(1);
                    },
                    buttonColor: Colors.white,
                    borderColor: Colors.white,
                    buttonTextColor: Colors.black,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.verticalSize * 0.6,
                    ),
                    child:  PrimaryButton(
                        title: Strings.delete,
                        // isLoading: Get.put(LogInController()).isLoading,
                        onPressed: () {
                          // Get.put(LogInController()).deleteAccountProcess();
                        },
                        buttonColor: Colors.red,
                        borderColor: Colors.red,
                      ),
                  ),
                ],
              ),
            );
          },
        );

 */

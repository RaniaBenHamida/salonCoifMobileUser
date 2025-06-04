part of '../screen/appointment_preview_screen.dart';

class PaymentMethod extends GetView<AppointmentPreviewController> {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSize * .6,
            vertical: Dimensions.paddingSize * .6),
        margin: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSize * .6,
            vertical: Dimensions.paddingSize * .4),
        decoration: BoxDecoration(
            color: Get.isDarkMode
                ? CustomColor.blackColor
                : CustomColor.whiteColor,
            borderRadius: BorderRadius.circular(Dimensions.radius)),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            TextWidget(
              Strings.paymentMethod,
              fontWeight: FontWeight.bold,
            ),
            Sizes.height.v10,
            InkWell(
              borderRadius: BorderRadius.circular(Dimensions.radius),
              onTap: () {
                _selectPaymentMethod(context);
              },
              child: Obx(() => Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSize * .6,
                        vertical: Dimensions.paddingSize * .4),
                    height: Dimensions.inputBoxHeight * .75,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: (controller.selectedMethodName.value.isEmpty)
                                ? Colors.grey.withValues(alpha: .6)
                                : Theme.of(context)
                                    .primaryColor
                                    .withValues(alpha: .6)),
                        borderRadius: BorderRadius.circular(Dimensions.radius)),
                    child: (controller.selectedMethodName.value.isEmpty)
                        ? TextWidget(Strings.selectPaymentMethod,
                            typographyStyle: TypographyStyle.titleSmall,
                            fontWeight: FontWeight.bold)
                        : Row(
                            children: [
                              TextWidget(controller.selectedPaymentMethod.name,
                                  typographyStyle: TypographyStyle.titleSmall,
                                  fontWeight: FontWeight.bold),
                            ],
                          ),
                  )),
            )
          ],
        ));
  }

  void _selectPaymentMethod(BuildContext context) {
    CustomDialog.openCustom(
        context: context,
        title: Strings.choosePaymentMethod,
        subTitle: Strings.choosePaymentMethodSubTitle,
        widget: SizedBox(
          height: MediaQuery.sizeOf(context).height * .28,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // if (controller.selectedPaymentMethods == null) {
                    //   controller.selectedPaymentMethods =
                    //       controller.paymentMethods[index].obs;
                    // } else {
                    //   controller.selectedPaymentMethods!.value =
                    //       controller.paymentMethods[index];
                    // }

                    controller.selectedPaymentMethod =
                        controller.paymentMethods[index];

                    controller.selectedMethodName.value =
                        controller.paymentMethods[index].name;

                    Get.close(1);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSize * .6,
                        vertical: Dimensions.paddingSize * .4),
                    height: Dimensions.inputBoxHeight * .75,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: controller.selectedMethodName.value !=
                                    controller.paymentMethods[index].name
                                ? Colors.transparent
                                : Theme.of(context)
                                    .primaryColor
                                    .withValues(alpha: .6)),
                        borderRadius: BorderRadius.circular(Dimensions.radius)),
                    child: Row(
                      children: [
                        // Container(
                        //   height: Dimensions.inputBoxHeight * .75,
                        //   width: Dimensions.inputBoxHeight * .75,
                        //   decoration: BoxDecoration(
                        //       shape: BoxShape.circle,
                        //       color: CustomColor.primary),
                        // ),

                        // TextWidget("IM",
                        //     typographyStyle: TypographyStyle.titleMedium,
                        //     fontWeight: FontWeight.bold),
                        Sizes.width.v5,
                        Expanded(
                          child: TextWidget(
                              controller.paymentMethods[index].name,
                              typographyStyle: TypographyStyle.titleSmall,
                              fontWeight: FontWeight.bold),
                        ),
                        (controller.selectedMethodName.value !=
                                controller.paymentMethods[index].name
                            ? SizedBox.shrink()
                            : Icon(Icons.check_circle,
                                color: CustomColor.primary))
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (_, i) => Sizes.height.v10,
              itemCount: controller.paymentMethods.length),
        ));
  }
}

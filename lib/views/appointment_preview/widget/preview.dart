part of '../screen/appointment_preview_screen.dart';

class Preview extends GetView<AppointmentPreviewController> {
  Preview({Key? key}) : super(key: key);


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
          color: Get.isDarkMode ? CustomColor.blackColor : CustomColor.whiteColor,
          borderRadius: BorderRadius.circular(Dimensions.radius)
        ),
        child: Column(
          children: [
            IconTextWidget(
              icon: Icons.person_2_outlined,
              text: Strings.parlourDetails,
            ),
            Sizes.height.v10,
            DoubleSideTextWidget(keys: Strings.parlourName, value: controller.previewController.salonInfo.name, needDivider: false),
            DoubleSideTextWidget(keys: Strings.serviceType, value: controller.previewController.serviceList.join(", "), needDivider: false),
            DoubleSideTextWidget(keys: Strings.date, value: controller.previewController.selectedDate.value, needDivider: false),
            DoubleSideTextWidget(keys: Strings.schedule, value: controller.previewController.selectedTime, needDivider: false),
            DoubleSideTextWidget(keys: Strings.serialNumber, value: "${controller.previewController.checkoutModel.data.serialNumber}", needDivider: false),
            DoubleSideTextWidget(keys: Strings.amount, value: "\TND${controller.previewController.checkoutModel.data.price.toStringAsFixed(2)}", needDivider: false),
            DoubleSideTextWidget(keys: Strings.feesAndCharge, value: "\TND${(controller.previewController.checkoutModel.data.payablePrice - controller.previewController.checkoutModel.data.price).toStringAsFixed(2)}", needDivider: false),
            DoubleSideTextWidget(keys: Strings.payableAmount, value: "\TND${controller.previewController.checkoutModel.data.payablePrice.toStringAsFixed(2)}", needDivider: false),
          ],
        )
    );
  }
}

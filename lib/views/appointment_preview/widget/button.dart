part of '../screen/appointment_preview_screen.dart';

class Button extends GetView<AppointmentPreviewController> {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSize * .6,
            vertical: Dimensions.paddingSize * .4),
        child: Obx(() => controller.isConfirmLoading
            ? Loader()
            : PrimaryButton(
                disable: (controller.selectedMethodName.value.isEmpty),
                title: Strings.confirmAppointment,
                onPressed: () {
                  if (controller.selectedMethodName.value == "Cash Payment") {
                    controller.processCashPayment();
                  } else {
                    if (controller.selectedPaymentMethod.alias
                        .toLowerCase()
                        .contains("automatic")) {
                      if (controller.selectedPaymentMethod.alias
                          .toLowerCase()
                          .contains("tatum")) {
                      } else {
                        controller.processAutomaticPayment();
                      }
                    }
                  }

                })));
  }
}

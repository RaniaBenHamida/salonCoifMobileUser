part of '../screen/schedule_screen.dart';

class CheckoutButton extends GetView<SalonDetailsController> {
  const CheckoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => !controller.showTimes.value
        ? SizedBox.shrink()
        : Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSize,
                vertical: Dimensions.paddingSize * .4),
            child: Column(
              children: [
                controller.isCheckoutLoading
                    ? Loader()
                    : PrimaryButton(
                        title: Strings.checkout,
                        disable:
                            (controller.selectedTimesIndexes.value == (-1)),
                        onPressed: () {
                          controller.checkoutPostApi();
                        }),
              ],
            )));
  }
}

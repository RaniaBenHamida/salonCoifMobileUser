part of '../screen/booking_detail_screen.dart';

class PaymentInformation extends GetView<BookingDetailController> {
  const PaymentInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Sizes.height.v10,
        IconTextWidget(
          icon: Icons.person_2_outlined,
          text: Strings.paymentInformation,
        ),
        Sizes.height.v10,
        DoubleSideTextWidget(keys: Strings.mtcnNumber, value: controller.data.trxId, needDivider: false),
        DoubleSideTextWidget(keys: Strings.paymentMethod, value: controller.data.paymentMethod, needDivider: false),
        DoubleSideTextWidget(keys: Strings.totalServicePrice, value: double.parse(controller.data.price).toStringAsFixed(2), needDivider: false),
        DoubleSideTextWidget(keys: Strings.feesAndCharge, value: double.parse(controller.data.totalCharge).toStringAsFixed(2), needDivider: false),
        DoubleSideTextWidget(keys: Strings.payableAmount, value: double.parse(controller.data.payablePrice).toStringAsFixed(2), needDivider: false),
        Row(
          children: [
            Spacer(),
            Row(
              children: [
                Container(
                  padding:
                  EdgeInsets.all(Dimensions.paddingSize * .2),
                  decoration: BoxDecoration(
                      color: controller.data.parlour.status.isEqual(1)
                          ? CustomColor.selected
                          : CustomColor.rejected,
                      shape: BoxShape.circle),
                ),
                Sizes.width.v5,
                TextWidget(
                    controller.data.parlour.status.isEqual(1)
                        ? Strings.success
                        : Strings.rejected,
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            )
          ],
        ),
        Sizes.height.v10,

      ],
    );
  }
}

part of '../screen/dashboard_screen.dart';

class SalonInfo extends GetView<DashboardController> {
  const SalonInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List data = [
      {
        "name": Strings.totalTransactions,
        "total": controller.totalTrx.value,
        "icon": Icons.attach_money_rounded
      },
      {
        "name": Strings.totalOnlineTransactions,
        "total": controller.onlineTrx.value,
        "icon": Icons.history_rounded
      },
      {
        "name": Strings.totalCashPayment,
        "total": controller.cashPayment.value,
        "icon": Icons.cloud_upload_outlined
      },
      // {
      //   "name": Strings.totalTransactionAmount,
      //   "total": controller.dashboardModel.data.totalTransactionsAmount==0
      //       ? "0"
      //       : double.parse(controller.totalAmount.value).toStringAsFixed(2),
      //   "icon": Icons.attach_money_rounded
      // }
    ];
    return Obx(() => controller.isLoading
        ? SizedBox.shrink()
        : controller.dashboardModel.data == []
            ? SizedBox.shrink()
            : _infoWidget(context, data));
  }

  _infoWidget(BuildContext context, List<dynamic> data) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(
        left: Dimensions.horizontalSize * .6,
        right: Dimensions.horizontalSize * .6,
        // top: Dimensions.verticalSize * .2,
        bottom: Dimensions.verticalSize * .5,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.horizontalSize * 0.6,
          vertical: Dimensions.verticalSize * 0.5,
        ),
        child: Column(
          children: [
            // Row(
            //   mainAxisAlignment: mainCenter,
            //   children: [_columnWidget(context, data[0])],
            // ),
            // Sizes.height.v15,
            Row(
              mainAxisAlignment: mainSpaceBet,
              children: [
                FittedBox(child: _columnWidget(context, data[2])),
                FittedBox(child: _columnWidget(context, data[0])),
                FittedBox(child: _columnWidget(context, data[1]))
              ],
            ),
          ],
        ),
      ),
    );
  }

  _columnWidget(BuildContext context, dynamic data,
      {TypographyStyle? typography}) {
    return Column(
      crossAxisAlignment: crossCenter,
      children: [
        Column(
          children: [
            Row(
              crossAxisAlignment: crossCenter,
              children: [
                _iconWidget(context, data),
                Sizes.width.v10,
                TextWidget(
                  data["total"].toString(),
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            Sizes.height.v5,
            SizedBox(
              width: 100,
              child: TextWidget(
                data["name"],
                textOverflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                typographyStyle: typography ?? TypographyStyle.labelMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }

  _iconWidget(BuildContext context, dynamic data) {
    return Container(
      height: Dimensions.radius * 4,
      width: Dimensions.radius * 4,
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(Dimensions.radius),
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              CustomColor.primary.withValues(alpha: .8),
              CustomColor.secondary.withValues(alpha: .8)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          color: CustomColor.primary),
      child: Icon(
        data["icon"],
        color: Colors.white,
        size: Dimensions.iconSizeLarge,
      ),
    );
  }
}

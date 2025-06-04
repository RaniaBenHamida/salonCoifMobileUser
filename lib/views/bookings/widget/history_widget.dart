part of '../screen/bookings_screen.dart';

class HistoryWidget extends GetView<BookingsController> {
  const HistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSize * .5,
          vertical: Dimensions.paddingSize * .4),
      child: controller.myBookingsModel.data.data.isEmpty
          ? NoDataWidget()
          : ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return HistoryTiles(index: index);
              },
              separatorBuilder: (_, i) => Sizes.height.v10,
              itemCount: controller.myBookingsModel.data.data.length),
    );
  }
}

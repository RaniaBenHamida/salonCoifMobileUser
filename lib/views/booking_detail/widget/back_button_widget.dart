part of '../screen/booking_detail_screen.dart';

class BackButtonWidget extends GetView<BookingDetailController> {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 12,
      top: 10,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.withValues(alpha: .5),
            borderRadius: BorderRadius.circular(Dimensions.radius * .7)
        ),
        child: BackButton(
          color: CustomColor.whiteColor,
        ),
      ),
    );
  }
}

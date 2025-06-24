part of '../screen/booking_detail_screen.dart';

class SalonImage extends GetView<BookingDetailController> {
  const SalonImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = controller.data;
    var imagePath = Get.find<BookingsController>().myBookingsModel.data.imagePath;
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSize * .2
        ),
        height: MediaQuery.sizeOf(context).height * .3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(Dimensions.radius))),
        child: CustomCachedImageWidget(
            radius: Dimensions.radius, image: data.parlour.image.isEmpty
            ? "${imagePath.baseUrl}/${imagePath.defaultImage}"
            : "${imagePath.baseUrl}/${imagePath.cleanedPathLocation}/${data.parlour.image}"));
  }
}

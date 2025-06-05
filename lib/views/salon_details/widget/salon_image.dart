part of '../screen/salon_details_screen.dart';

class SalonImage extends GetView<SalonDetailsController> {
  const SalonImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = controller.salonInfo;
    var imagePath = Get.find<DashboardController>().parlourListInfo.data.parlourImagePath;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize * .2
      ),
        height: MediaQuery.sizeOf(context).height * .3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(Dimensions.radius))),
        child: CustomCachedImageWidget(
            radius: Dimensions.radius, image: data.image.isEmpty
            ? "${imagePath.baseUrl}/${imagePath.defaultImage}"
            : "${imagePath.baseUrl}/${imagePath.cleanedPathLocation}/${data.image}"));
  }
}

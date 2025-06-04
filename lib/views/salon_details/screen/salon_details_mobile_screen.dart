part of 'salon_details_screen.dart';

class SalonDetailsMobileScreen extends GetView<SalonDetailsController> {
  const SalonDetailsMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.isLoading ? Loader(): _bodyWidget(context)),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            color: Get.isDarkMode ? CustomColor.blackColor : CustomColor.whiteColor,
          ),
          SalonImage(),
          MainPage(),
          BackButtonWidget()
        ],
      ),
    );
  }
}
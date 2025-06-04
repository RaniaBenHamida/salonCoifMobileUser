part of '../screen/salon_details_screen.dart';

class MainPage extends GetView<SalonDetailsController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .245,
          ),
          AnimatedContainer(
            margin: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSize * .2,
                vertical: Dimensions.paddingSize * .4),
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSize * .8,
                vertical: Dimensions.paddingSize * .6),
            decoration: BoxDecoration(
                color: CustomColor.whiteColor,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(Dimensions.radius * 2))),
            duration: Duration(seconds: 1),
            curve: Curves.easeInCubic,
            child: Obx(() => Column(
                  children: [
                    Details(),
                    controller.isLoading
                        ? SizedBox.shrink()
                        : Column(
                            children: [
                              Service(),
                              !controller.showSchedule.value
                                  ? SizedBox.shrink()
                                  : Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              Dimensions.paddingSize * .2,
                                          vertical:
                                              Dimensions.paddingSize * .4),
                                      child: Column(
                                        children: [
                                          controller.isCheckoutLoading
                                              ? Loader()
                                              : Obx(
                                                  () => PrimaryButton(
                                                      title: Strings.confirm,
                                                      disable: controller
                                                          .selectedServicesIndexes
                                                          .isEmpty,
                                                      onPressed: () {
                                                        Routes.scheduleScreen
                                                            .toNamed;
                                                      }),
                                                ),
                                        ],
                                      )),
                            ],
                          ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

part of '../screen/dashboard_screen.dart';

class Services extends GetView<DashboardController> {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Dimensions.paddingSize * .6,
          top: Dimensions.paddingSize * .0,
          bottom: Dimensions.paddingSize * .0),
      margin: EdgeInsets.only(
          top: Dimensions.paddingSize * .6,
          bottom: Dimensions.paddingSize * .6),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              TextWidget(
                Strings.serviceItem,
                padding: EdgeInsets.only(right: Dimensions.paddingSize * .6),
                fontWeight: FontWeight.w900,
                // style: TextStyle(fontWeight: FontWeight.w600),
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.servicesScreen);
                  },
                  child: TextWidget(Strings.seeAll,
                      style: Theme.of(context).textTheme.bodyLarge)),
            ],
          ),
          SizedBox(
            height: Dimensions.buttonHeight * 1.6,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var path = controller.homeModel.data.baseUr +
                      "/" +
                      controller.homeModel.data.imagePath +
                      "/";
                  var data = controller.homeModel.data.serviceData[index];
                  return index == 0
                      ? SizedBox.shrink()
                      : GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.servicesScreen);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Column(
                              crossAxisAlignment: crossCenter,
                              children: [
                                CircleAvatar(
                                  radius: Dimensions.iconSizeLarge * 1.4,
                                  backgroundImage: data.image.isEmpty
                                      ? NetworkImage(
                                          controller.homeModel.data.baseUr +
                                              "/" +
                                              controller
                                                  .homeModel.data.defaultImage)
                                      : NetworkImage(path + data.image),
                                  // child: data.image.isNotEmpty ? null : Icon(Icons.cut),
                                  backgroundColor: Theme.of(context)
                                      .primaryColor
                                      .withValues(alpha: .3),
                                ),
                                Sizes.height.v5,
                                TextWidget(data.title,
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                              ],
                            ),
                          ),
                        );
                },
                separatorBuilder: (_, i) => Sizes.width.v5,
                itemCount: controller.homeModel.data.serviceData.length
                        .isGreaterThan(5)
                    ? 5
                    : controller.homeModel.data.serviceData.length),
          )
        ],
      ),
    );
  }
}

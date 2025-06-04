part of '../screen/dashboard_screen.dart';

class BannerWidget extends GetView<DashboardController> {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSize * .6,
            vertical: Dimensions.paddingSize * .0),

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              CustomCachedImageWidget(image: "${controller.homeModel.data.baseUr}/${controller.homeModel.data.imagePath}/"+controller.homeModel.data.bannerData.first.image),
              Container(
                decoration: BoxDecoration(
                  color: CustomColor.blackColor.withValues(alpha: .4),
                  borderRadius: BorderRadius.circular(0), // optional rounded corners
                ),
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: crossStart,
                  children: [
                    TextWidget(controller.homeModel.data.bannerData.first.heading, typographyStyle: TypographyStyle.labelSmall, color: CustomColor.whiteColor, fontWeight: FontWeight.bold,),
                    Sizes.height.v5,
                    TextWidget(controller.homeModel.data.bannerData.first.subHeading, typographyStyle: TypographyStyle.labelSmall, color: CustomColor.whiteColor),
                  ],
                ),
              ),
            ],
          ),
        ),

        // child: Stack(
        //   alignment: Alignment.center,
        //   children: [
        //     CarouselSlider(
        //       options: CarouselOptions
        //         (autoPlay: false,
        //           height: 200.0,
        //         onPageChanged: (index, reason){
        //           controller.currentIndex.value = index;
        //         }
        //       ),
        //       items: controller.homeModel.data.bannerData.map((image) {
        //         return Builder(
        //           builder: (BuildContext context) {
        //             return Padding(
        //               padding: EdgeInsets.symmetric(horizontal: 5),
        //               child: CustomCachedImageWidget(image: "${controller.homeModel.data.baseUr}/${controller.homeModel.data.imagePath}/"+image.image),
        //             );
        //           },
        //         );
        //       }).toList(),
        //     ),
        //
        //     // Paste Here Line Indicator
        //     // Obx(() => Positioned(
        //     //   bottom: 10, // Adjust position relative to the bottom of the carousel
        //     //   child: Row(
        //     //     mainAxisAlignment: MainAxisAlignment.center,
        //     //     children: controller.homeModel.data.bannerData.asMap().entries.map((entry) {
        //     //       return AnimatedContainer(
        //     //         duration: Duration(milliseconds: 300),
        //     //         margin: EdgeInsets.symmetric(horizontal: 4.0),
        //     //         height: 4.0,
        //     //         width: controller.currentIndex.value == entry.key ? 20.0 : 6.0, // Active line is longer
        //     //         decoration: BoxDecoration(
        //     //           color: controller.currentIndex.value == entry.key
        //     //               ? CustomColor.primary
        //     //               : Colors.grey[300],
        //     //           borderRadius: BorderRadius.circular(2),
        //     //         ),
        //     //       );
        //     //     }).toList(),
        //     //   ),
        //     // )),
        //   ],
        // )
    );
  }
}
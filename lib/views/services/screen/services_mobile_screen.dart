part of 'services_screen.dart';

class ServicesMobileScreen extends GetView<ServicesController> {
  ServicesMobileScreen({super.key});

  final servicesData = Get.find<DashboardController>().homeModel.data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(Strings.serviceItem),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSize * .6,
              vertical: Dimensions.paddingSize * .4),
          itemBuilder: (_, index) {
            var path = servicesData.baseUr + "/" + servicesData.imagePath + "/";
            var data = servicesData.serviceData[index];
            return index == 0
                ? _firstWidget()
                : Container(
                    padding: const EdgeInsets.all(8.0),
                    // height: MediaQuery.sizeOf(context).height * .16,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            spreadRadius: 1,
                            blurRadius: 2,
                          )
                        ],
                        // color: CustomColor.primary.withValues(alpha: .2),
                        borderRadius: BorderRadius.circular(Dimensions.radius)),
                    child: Row(
                      crossAxisAlignment: crossStart,
                      mainAxisAlignment: mainStart,
                      children: [
                        Expanded(
                            // flex: 5,
                            child: CustomCachedImageWidget(
                                image: data.image.isEmpty
                                    ? "${servicesData.baseUr}/${servicesData.defaultImage}"
                                    : "${path}/${data.image}")),
                        Sizes.width.v10,
                        Expanded(
                            // flex: 5,
                            child: Column(
                          crossAxisAlignment: crossStart,
                          children: [
                            TextWidget(
                              data.title,
                              fontWeight: FontWeight.w600,
                              typographyStyle: TypographyStyle.labelMedium,
                              color: CustomColor.primary,
                            ),
                            Sizes.width.v5,
                            data.heading.isEmpty
                                ? SizedBox.shrink()
                                : TextWidget(
                                    data.heading,
                                    fontWeight: FontWeight.w600,
                                    typographyStyle:
                                        TypographyStyle.labelMedium,
                                  ),
                            data.subHeading.isEmpty
                                ? SizedBox.shrink()
                                : TextWidget(
                                    data.subHeading,
                                    typographyStyle: TypographyStyle.labelSmall,
                                  ),
                            data.description.isEmpty
                                ? SizedBox.shrink()
                                : TextWidget(
                                    data.description,
                                    typographyStyle: TypographyStyle.labelSmall,
                                  ),
                          ],
                        ))
                      ],
                    ),
                  );
          },
          separatorBuilder: (_, i) => Sizes.height.v10,
          itemCount: servicesData.serviceData.length),
    );
  }

  _firstWidget() {
    var data = servicesData.serviceData[0];
    return Container(
      padding: EdgeInsets.all(Dimensions.radius),
      margin: EdgeInsets.only(
        bottom: Dimensions.heightSize,
      ),
      // height: MediaQuery.sizeOf(context).height * .16,
      decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: CustomColor.whiteColor,
          //     spreadRadius: 1,
          //     blurRadius: 2,
          //   )
          // ],
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(Dimensions.radius)),
      child: Row(
        crossAxisAlignment: crossStart,
        mainAxisAlignment: mainStart,
        children: [
          Expanded(
              // flex: 5,
              child: Column(
            crossAxisAlignment: crossStart,
            children: [
              TextWidget(
                data.title,
                fontWeight: FontWeight.w600,
                typographyStyle: TypographyStyle.labelLarge,
                color: CustomColor.primary,
              ),
              Sizes.width.v5,
              data.heading.isEmpty
                  ? SizedBox.shrink()
                  : TextWidget(
                      data.heading,
                      fontWeight: FontWeight.w600,
                      typographyStyle: TypographyStyle.bodyLarge,
                    ),
              data.subHeading.isEmpty
                  ? SizedBox.shrink()
                  : TextWidget(
                      data.subHeading,
                      typographyStyle: TypographyStyle.labelSmall,
                    ),
              data.description.isEmpty
                  ? SizedBox.shrink()
                  : TextWidget(
                      data.description,
                      typographyStyle: TypographyStyle.labelSmall,
                    ),
            ],
          ))
        ],
      ),
    );
  }
}

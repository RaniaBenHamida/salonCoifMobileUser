part of '../screen/find_screen.dart';

class SalonService extends GetView<FindController> {
  SalonService({Key? key}) : super(key: key);

  final dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Get.find<DashboardController>().isSearchLoading
        ? Loader()
        : Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSize * .6,
                vertical: Dimensions.paddingSize * .0),
            child: Column(
              crossAxisAlignment: crossStart,
              children: [
                TextWidget(
                  Strings.salons,
                  padding: EdgeInsets.only(right: Dimensions.paddingSize * .6),
                  fontWeight: FontWeight.w900,
                  // style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Sizes.height.v5,
                dashboardController.parlorList.isEmpty
                    ? NoDataWidget()
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          mainAxisExtent: 300,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: dashboardController.parlorList.length,
                        itemBuilder: (context, index) {
                          var data = dashboardController.parlorList[index];
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.salonDetailsScreen,
                                  arguments: [data]);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withValues(alpha: .2),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                    )
                                  ],
                                  // color: CustomColor.primary.withValues(alpha: .2),
                                  borderRadius:
                                      BorderRadius.circular(Dimensions.radius)),
                              child: Column(
                                crossAxisAlignment: crossStart,
                                children: [
                                  Expanded(
                                      child: CustomCachedImageWidget(
                                          image: data.image.isEmpty
                                              ? "${dashboardController.parlourListInfo.data.parlourImagePath.baseUrl}/${dashboardController.parlourListInfo.data.parlourImagePath.defaultImage}"
                                              : "${dashboardController.parlourListInfo.data.parlourImagePath.baseUrl}/${dashboardController.parlourListInfo.data.parlourImagePath.cleanedPathLocation}/${data.image}")),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: crossStart,
                                      children: [
                                        Sizes.height.v5,
                                        TextWidget(data.name,
                                            fontWeight: FontWeight.w600,
                                            maxLines: 1,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .fontSize),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextWidget(
                                                  data.managerName.isEmpty
                                                      ? Strings.experience
                                                      : data.managerName,
                                                  fontWeight: FontWeight.w400,
                                                  maxLines: 1,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .fontSize),
                                            ),
                                            TextWidget(data.experience,
                                                fontWeight: FontWeight.w400,
                                                maxLines: 1,
                                                fontSize: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .fontSize),
                                          ],
                                        ),
                                        Sizes.height.v5,
                                        TextWidget(data.address,
                                            opacity: .5,
                                            fontWeight: FontWeight.w600,
                                            maxLines: 2,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .fontSize),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                Sizes.height.v10
              ],
            )));
  }
}

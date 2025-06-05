part of '../screen/dashboard_screen.dart';

class SalonService extends GetView<DashboardController> {
  const SalonService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSize * .6,
            vertical: Dimensions.paddingSize * .0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: mainSpaceBet,
              children: [
                TextWidget(
                  Strings.salons,
                  padding: EdgeInsets.only(right: Dimensions.paddingSize * .6),
                  fontWeight: FontWeight.w900,
                  // style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextButton(
                    onPressed: () {
                      Get.find<NavigationController>().selectedIndex.value = 1;
                    },
                    child: TextWidget(Strings.seeAll,
                        style: Theme.of(context).textTheme.bodyLarge)),
              ],
            ),
            controller.parlourListInfo.data.parlourList.isEmpty
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
                    itemCount: controller
                            .parlourListInfo.data.parlourList.length
                            .isGreaterThan(4)
                        ? 4
                        : controller.parlourListInfo.data.parlourList.length,
                    itemBuilder: (context, index) {
                      var data =
                          controller.parlourListInfo.data.parlourList[index];
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
                                          ? "${controller.parlourListInfo.data.parlourImagePath.baseUrl}/${controller.parlourListInfo.data.parlourImagePath.defaultImage}"
                                          : "${controller.parlourListInfo.data.parlourImagePath.baseUrl}/${controller.parlourListInfo.data.parlourImagePath.cleanedPathLocation}/${data.image}")),
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
        ));
  }
}

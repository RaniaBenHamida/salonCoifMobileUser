part of '../screen/dashboard_screen.dart';

class SearchBar extends GetView<DashboardController> {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSize * .6,
          vertical: Dimensions.paddingSize * .4),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: PrimaryInputWidget(
                  onChanged: (value){
                    Get.find<DashboardController>().isSearched.value = false;
                  },
                  controller: controller.searchController,
                  hintText: Strings.parlourName)),
          Sizes.width.v5,
          InkWell(
            borderRadius: BorderRadius.circular(Dimensions.radius * .6),
            onTap: () {
              if (!controller.isSearched.value) {
                print("-------------");
                print(controller.selectedLocationName.value);
                if (controller.selectedLocationName.value == "" &&
                    controller.searchController.text == "")
                {
                  controller.parlourInfo();
                }
                else {
                  controller.searchParlour();
                }
              } else {
                controller.parlourInfo();
              }
            },
            child: Obx(() => Container(
                  height: Dimensions.inputBoxHeight * .75,
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSize * .5),
                  decoration: BoxDecoration(
                    color: CustomColor.primary,
                    borderRadius: BorderRadius.circular(Dimensions.radius * .6),
                  ),
                  child: Icon(
                    controller.isSearched.value
                        ? Icons.close
                        : Icons.search_rounded,
                    color: Colors.white,
                    size: Dimensions.iconSizeLarge,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

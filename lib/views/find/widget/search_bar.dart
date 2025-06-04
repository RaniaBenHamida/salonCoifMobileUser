part of '../screen/find_screen.dart';

class SearchBar extends GetView<FindController> {
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
                  controller: Get.find<DashboardController>().searchController,
                  hintText: Strings.parlourName)),
          Sizes.width.v5,
          InkWell(
            borderRadius: BorderRadius.circular(Dimensions.radius * .6),
            onTap: () {
              if (!Get.find<DashboardController>().isSearched.value) {
                // Get.find<DashboardController>().searchParlour();

                print("-------------");
                print(Get.find<DashboardController>().selectedLocationName.value);
                if (Get.find<DashboardController>().selectedLocationName.value == "" &&
                    Get.find<DashboardController>().searchController.text == "")
                {
                  Get.find<DashboardController>().parlourInfo();
                }
                else {
                  Get.find<DashboardController>().searchParlour();
                }
              } else {
                Get.find<DashboardController>().parlourInfo();
              }
            },
            child: Obx(() => Container(
              height: Dimensions.inputBoxHeight * .75,
              padding:
                  EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * .5),
              decoration: BoxDecoration(
                color: CustomColor.primary,
                borderRadius: BorderRadius.circular(Dimensions.radius * .6),
              ),
              child: Icon(
                Get.find<DashboardController>().isSearched.value
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

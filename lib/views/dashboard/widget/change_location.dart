part of '../screen/dashboard_screen.dart';

class ChangeLocation extends GetView<DashboardController> {
  ChangeLocation({Key? key}) : super(key: key);

  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TextWidget(Strings.location,
            padding:
                EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * .5),
            opacity: .5,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                )),
        Obx(() => controller.isLoading
            ? SizedBox.shrink()
            : SizedBox(
                width: Dimensions.widthSize * 16,
                child: CustomDropDown<Area>(
                    itemsList: [Area(id: -1, slug: "", name: "All Area", status: -1), ...controller.parlourListInfo.data.area],
                    fieldPadding: EdgeInsets.zero,
                    preWidget: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Icon(Icons.location_on_rounded,
                          color: CustomColor.primary,),
                    ),
                    showSearchField: false,
                    innerTextStyle: Theme.of(context).textTheme.bodySmall,
                    style: Theme.of(context).textTheme.bodyLarge,
                    onChanged: (value) {
                      if(value!.name == "All Area"){
                        controller.selectedLocationName.value = "";
                        print("**************** 1");
                        print(controller.selectedLocationName.value);
                        if(controller.searchController.text.isNotEmpty){

                          controller.searchParlour();
                        }else {
                          controller.parlourInfo();
                        }
                      }
                      else{
                        print("**************** 2");

                        controller.isSearched.value = false;
                        controller.selectedLocation.value = value;
                        controller.selectedLocationName.value = value.name;
                        controller.searchParlour();
                      }

                    },
                    decoration: BoxDecoration(),
                    selectMethod: controller.selectedLocationName.value == ''
                        ? Strings.selectLocation.obs
                        : controller.selectedLocationName),
              ))
      ],
    );
  }
}

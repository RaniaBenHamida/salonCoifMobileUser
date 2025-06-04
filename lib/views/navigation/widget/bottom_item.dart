import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beautyTn/views/navigation/controller/navigation_controller.dart';

import '../../../base/utils/basic_import.dart';
import '../../dashboard/controller/dashboard_controller.dart';

class BottomItem extends StatelessWidget {
  BottomItem({super.key, this.icon, required this.label, this.index});
  final IconData? icon;
  final String label;
  final int? index;
  final controller = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {
        if(index == 0 || index == 1){
          Get.find<DashboardController>().searchController.text = "";
          Get.find<DashboardController>().selectedLocationName.value = "";
          Get.find<DashboardController>().isSearched.value = false;
          Get.find<DashboardController>().parlorList.clear();
          Get.find<DashboardController>().parlorList.addAll(Get.find<DashboardController>().parlourListInfo.data.parlourList);
        }
        controller.selectedIndex.value = index!;
      },
      child:  SizedBox(
          width: Dimensions.widthSize * 5.8,
          child: Obx(() => Column(
            children: [
              Container(
                height: Dimensions.heightSize * .7,
                width: Dimensions.widthSize * 1.5,
                decoration: BoxDecoration(
                    color: controller.selectedIndex.value == index
                        ? CustomColor.primary : Colors.transparent,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(Dimensions.radius * 5),
                      bottomRight: Radius.circular(Dimensions.radius * 5),
                    )
                ),
              ),

              Sizes.height.v10,

              Column(
                mainAxisAlignment: mainCenter,
                children: [
                  Icon(
                    icon,
                    color: controller.selectedIndex.value == index
                        ? CustomColor.primary
                        : CustomColor.disableColor,
                  ),
                  TextWidget(
                    label,
                    style: TextStyle(
                      fontSize: Dimensions.labelSmall * 0.9,
                      fontWeight: FontWeight.w500,
                    ),
                    color: controller.selectedIndex.value == index
                        ? CustomColor.primary
                        : CustomColor.disableColor,
                  ),
                  Sizes.height.v5,
                ],
              ),
            ],
          )),
        )
    );
  }
}

part of '../screen/dashboard_screen.dart';

class LocationSelect extends GetView<DashboardController> {
  const LocationSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Sizes.height.v10,
          Padding(
            padding: EdgeInsets.only(right: Dimensions.paddingSize * .2),
            child: Row(
              children: [
                ChangeLocation(),
                Spacer(),
                IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none_rounded, size: Dimensions.iconSizeLarge * .9,)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

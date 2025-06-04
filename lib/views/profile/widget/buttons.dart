part of '../screen/profile_screen.dart';

class Buttons extends GetView<ProfileController> {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSize * .6,
          vertical: Dimensions.paddingSize * 0.4),
      child: Row(
        children: [
          Expanded(
              child: PrimaryButton(
                height: Dimensions.buttonHeight * .75,
                fontSize: Dimensions.titleSmall,
                  fontWeight: FontWeight.bold,
                  buttonColor: CustomColor.primary,
                  title: Strings.bookSchedule,
                  onPressed: () {
                  Get.find<NavigationController>().selectedIndex.value = 1;
                  })),
          Sizes.width.v10,
          Expanded(
              child: PrimaryButton(
                  height: Dimensions.buttonHeight * .75,
                  fontSize: Dimensions.titleSmall,
                  fontWeight: FontWeight.bold,
                  buttonColor: CustomColor.secondaryDark,
                  title: Strings.myBooking,
                  onPressed: () {
                    Get.find<NavigationController>().selectedIndex.value = 2;
                  })),
        ],
      ),
    );
  }
}

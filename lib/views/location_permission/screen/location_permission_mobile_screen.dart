part of 'location_permission_screen.dart';

class LocationPermissionMobileScreen
    extends GetView<LocationPermissionController> {
  const LocationPermissionMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSize * .5),
        child: ListView(
          // mainAxisAlignment: mainCenter,
          children: [
            Image.asset(
              "assets/icons/location_permission.png",
              // height: 200,
              // width: 200,
            ),
            Sizes.height.v30,
            TitleSubTitleWidget(
              showImage: false,
                title: Strings.whatIsYourLocation,
                subTitle: Strings.locationAccessSubTitle,
                isCenterText: true),
            Sizes.height.v40,
            PrimaryButton(
                title: Strings.allowLocationAccess, onPressed: () {
                  Get.offAllNamed(Routes.navigation);
            }, disable: false),
            Sizes.height.v20,

            TextButton(onPressed: (){
              Get.offAllNamed(Routes.navigation);
            }, child: TextWidget(Strings.enterLocationManually))
          ],
        ),
      ),
    );
  }
}

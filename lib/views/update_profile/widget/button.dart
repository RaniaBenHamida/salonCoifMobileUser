part of '../screen/update_profile_screen.dart';

class Button extends GetView<UpdateProfileController> {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSize * .6,
            vertical: Dimensions.paddingSize * .4),
        child: Obx(() => controller.isUpdateLoading
            ? Loader()
            : PrimaryButton(
                height: Dimensions.buttonHeight * .75,
                fontSize: Dimensions.titleSmall,
                fontWeight: FontWeight.bold,
                buttonColor: CustomColor.primary,
                title: Strings.update,
                onPressed: () {
                  controller.updateProfile();
                })));
  }
}

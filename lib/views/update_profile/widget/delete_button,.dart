part of '../screen/update_profile_screen.dart';

class DeleteButton extends GetView<UpdateProfileController> {
  const DeleteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSize * .4,
          vertical: Dimensions.paddingSize * .4),
      child: PrimaryButton(
          height: Dimensions.buttonHeight * .75,
          fontSize: Dimensions.titleSmall,
          fontWeight: FontWeight.bold,
          buttonColor: CustomColor.secondaryDark,
          title: Strings.delete,
          onPressed: () {
            debugPrint("Clicked");
            CustomDialog.open(
                context: context,
                loading: controller.isDeleteLoading,
                onConfirm: () {
                  controller.deleteProfile();
                },
                title: Strings.deleteAccount,
                subTitle: Strings.deleteAccountSubTitle);
          }),
    );
  }
}

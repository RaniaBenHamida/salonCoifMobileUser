part of '../screen/profile_screen.dart';

class NavProfileWidget extends GetView<ProfileController> {
  const NavProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var profileModel = Get.find<UpdateProfileController>();

    return Obx(
      () => Container(
          margin: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSize * .6,
              vertical: Dimensions.paddingSize * .2),
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSize * .6,
              vertical: Dimensions.paddingSize * .4),
          decoration: BoxDecoration(
            color: Get.isDarkMode ? Colors.grey : Colors.white,
            borderRadius: BorderRadius.circular(Dimensions.radius * .8),
          ),
          child: Row(
            children: [
              Get.find<UpdateProfileController>().isLoading
                  ? SizedBox.shrink()
                  : CircleAvatar(
                      radius: Dimensions.radius * 4,
                      // shape: BoxShape.circle,
                      backgroundColor: CustomColor.disableColor,
                      backgroundImage: profileModel
                              .profileInfoModel.data.userInfo.image.isEmpty
                          ? NetworkImage(
                              "${profileModel.profileInfoModel.data.imagePaths.baseUrl}/${profileModel.profileInfoModel.data.imagePaths.cleanedDefaultImage}")
                          : NetworkImage(
                              "${profileModel.profileInfoModel.data.imagePaths.baseUrl}/${profileModel.profileInfoModel.data.imagePaths.cleanedPathLocation}/${profileModel.profileInfoModel.data.userInfo.image}")),
              Sizes.width.v10,
              Expanded(
                child: Column(
                  crossAxisAlignment: crossStart,
                  children: [
                    TextWidget(
                      Get.find<UpdateProfileController>().isLoading
                          ? ""
                          : profileModel.fullName.value,
                      style: Theme.of(context).textTheme.titleMedium,
                      fontWeight: FontWeight.w600,
                    ),
                    // Sizes.height.v5,
                    TextWidget(
                        Get.find<UpdateProfileController>().isLoading
                            ? ""
                            : profileModel.profileInfoModel.data.userInfo.email,
                        style: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        opacity: .6,
                        color: CustomColor.primary),

                    Sizes.height.v5,

                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.update_profileScreen);
                      },
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius * .4),
                              color: CustomColor.rejected),
                          child: TextWidget(Strings.edit,
                              color: CustomColor.whiteColor,
                              style: Theme.of(context).textTheme.bodySmall)),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

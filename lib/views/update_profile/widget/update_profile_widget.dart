part of '../screen/update_profile_screen.dart';

class UpdateProfileWidget extends GetView<UpdateProfileController> {
  const UpdateProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = controller.profileInfoModel.data.userInfo;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSize * .6,
          vertical: Dimensions.paddingSize * .4),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Obx(() => CustomCachedImageWidget(
                  height: Dimensions.paddingSize * 4,
                  width: Dimensions.paddingSize * 4,
                  shape: BoxShape.circle,
                  filePath: controller.imagePath.value,
                  image: data.image.isEmpty
                      ? "${controller.profileInfoModel.data.imagePaths.baseUrl}/${controller.profileInfoModel.data.imagePaths.defaultImage}"
                      : "${controller.profileInfoModel.data.imagePaths.baseUrl}/${controller.profileInfoModel.data.imagePaths.pathLocation}/${data.image}")),
              Positioned(
                  child: IconButton(
                      onPressed: () {
                        CustomDialog.openCustom(
                            context: context,
                            title: Strings.updateProfileTitle,
                            subTitle: Strings.updateProfileSubTitle,
                            widget: ImagePickerSheet(
                              fromCamera: () {
                                controller.pickImage(ImageSource.camera);
                                Get.back();
                              },
                              fromGallery: () {
                                controller.pickImage(ImageSource.gallery);
                                Get.back();
                              },
                            ));
                      },
                      icon: CircleAvatar(
                        backgroundColor: Colors.grey.withValues(alpha: .5),
                        child: Icon(Icons.camera_alt_outlined,
                            color: CustomColor.primary),
                      )))
            ],
          ),
          Sizes.height.v10,
          Column(
            crossAxisAlignment: crossCenter,
            children: [
              TextWidget(controller.fullName.value,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
              Sizes.height.v5,
              TextWidget(data.email,
                  style: Theme.of(context).textTheme.bodyLarge,
                  fontWeight: FontWeight.w600,
                  opacity: .6,
                  color: CustomColor.primary),
            ],
          )
        ],
      ),
    );
  }
}

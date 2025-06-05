part of '../screen/profile_screen.dart';

class ListTiles extends GetView<ProfileController> {
  ListTiles({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogInController());

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSize * .6,
          vertical: Dimensions.paddingSize * .2),
      decoration: BoxDecoration(),
      child: Column(
        children: [
          CustomTiles(
            onTap: () {
              Get.toNamed(Routes.servicesScreen);
            },
            text: Strings.service,
            leadingIcon: Icons.design_services_outlined,
          ),
          CustomTiles(
            onTap: () {
              Get.toNamed(Routes.settingsScreen);
            },
            text: Strings.settings,
            leadingIcon: Icons.settings_outlined,
          ),
          // CustomTiles(
          //   onTap: () {
          //     Get.to(FlutterWebScreen(url:""));
          //   },
          //   text: Strings.blog,
          //   leadingIcon: Icons.panorama_photosphere,
          // ),
          // CustomTiles(
          //   onTap: () {
          //     Get.to(FlutterWebScreen(url: ApiConfig.mainDomain + "/link/refund-policy"));
          //   },
          //   text: Strings.refund,
          //   leadingIcon: Icons.currency_exchange,
          // ),
          // CustomTiles(
          //   onTap: () {
          //     Get.to(FlutterWebScreen(url: ApiConfig.mainDomain + "/link/privacy-policy"));
          //   },
          //   text: Strings.privacyPolicy,
          //   leadingIcon: Icons.policy_outlined,
          // ),
          CustomTiles(
            onTap: () {
              Get.to(FlutterWebScreen(url: ApiConfig.mainDomain + "/about"));
            },
            text: Strings.aboutUs,
            leadingIcon: Icons.info_outline_rounded,
          ),
          // CustomTiles(
          //   onTap: () {
          //     Get.to(FlutterWebScreen(url: ApiConfig.mainDomain + "/contact"));
          //   },
          //   text: Strings.contact,
          //   leadingIcon: Icons.markunread_mailbox_outlined,
          // ),
          Obx(() => controller.isLoading ? Loader(color: CustomColor.primary,): CustomTiles(
            onTap: () {
              CustomDialog.open(
                  context: context,
                  onConfirm: () {
                    Get.close(1);
                    controller.logOutProcess();
                    },
                  loading: controller.isLoading,
                  title: Strings.logOut2,
                  subTitle: Strings.logOutSubTitle);
            },
            text: Strings.logOut,
            leadingIcon: Icons.exit_to_app_rounded,
          )),
        ],
      ),
    );
  }
}

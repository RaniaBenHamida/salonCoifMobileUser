part of 'update_profile_screen.dart';

class UpdateProfileMobileScreen extends GetView<UpdateProfileController> {
  const UpdateProfileMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Strings.updateProfile,
        action: [
          TextButton(
              onPressed: () {
                CustomDialog.open(
                    context: context,
                    onConfirm: () {
                      Get.close(1);
                      Get.find<LogInController>().deleteAccountProcess();
                    },
                    title: Strings.deleteAccount,
                    subTitle: Strings.deleteAccountSubTitle);
              },
              child: TextWidget(
                Strings.delete,
                color: CustomColor.rejected,
                fontWeight: FontWeight.bold,
                style: Theme.of(context).textTheme.titleSmall,
              ))
        ],
      ),
      body: Obx(() => controller.isLoading ? Loader() : _bodyWidget(context)),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        color: CustomColor.primary,
        onRefresh: () async {},
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: Sizes.height.v20),
            SliverToBoxAdapter(child: UpdateProfileWidget()),
            SliverToBoxAdapter(child: InputField()),
            SliverToBoxAdapter(child: Button()),
            // SliverToBoxAdapter(child: DeleteButton()),
          ],
        ),
      ),
    );
  }
}

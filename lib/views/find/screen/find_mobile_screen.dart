part of 'find_screen.dart';

class FindMobileScreen extends GetView<FindController> {
  const FindMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashboardAppbar(),
      body: Obx(() => Get.find<DashboardController>().isLoading
          ? Loader()
          : _bodyWidget(context)),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        color: CustomColor.primary,
        onRefresh: () async {
          Get.find<DashboardController>().parlourInfo();
        },
        child: CustomScrollView(
          /// wrap with SliverToBoxAdapter() in every child in slivers
          slivers: [
            SliverToBoxAdapter(child: SearchBar()),
            SliverToBoxAdapter(child: SalonService()),
          ],
        ),
      ),
    );
  }
}

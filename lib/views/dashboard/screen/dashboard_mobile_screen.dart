part of 'dashboard_screen.dart';

class DashboardMobileScreen extends GetView<DashboardController> {
  const DashboardMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashboardAppbar(),
      body: Obx(() => controller.isLoading ||
              controller.isisBannerLoadingLoading ||
              controller.isDashboardLoading
          ? Loader()
          : _bodyWidget(context)),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        color: CustomColor.primary,
        onRefresh: () async {
          controller.parlourInfo();
        },
        child: CustomScrollView(
          /// wrap with SliverToBoxAdapter() in every child in slivers
          slivers: [
            SliverToBoxAdapter(child: SearchBar()),
            SliverToBoxAdapter(child: SalonInfo()),
            SliverToBoxAdapter(child: BannerWidget()),
            SliverToBoxAdapter(child: Services()),
            SliverToBoxAdapter(child: SalonService()),
          ],
        ),
      ),
    );
  }
}

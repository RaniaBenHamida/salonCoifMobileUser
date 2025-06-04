part of 'navigation_screen.dart';

class NavigationMobileScreen extends GetView<NavigationController> {
  const NavigationMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // appBar: controller.selectedIndex.value.isEqual(0) || controller.selectedIndex.value.isEqual(1) ? DashboardAppbar() : null,
      body: Obx(() => controller.bodyPages[controller.selectedIndex.value]),
      bottomNavigationBar: NavigationBarWidget(),
    );
  }
}

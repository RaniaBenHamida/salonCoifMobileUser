part of 'notification_screen.dart';

class NotificationMobileScreen extends GetView<NotificationController> {
  const NotificationMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(Strings.notification),
      body: Obx(() => controller.isLoading ? Loader() : _bodyWidget(context)),
    );
  }

  _bodyWidget(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [ListWidget()],
      ),
    );
  }
}

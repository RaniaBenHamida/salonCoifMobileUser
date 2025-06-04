part of 'appointment_preview_screen.dart';

class AppointmentPreviewMobileScreen
    extends GetView<AppointmentPreviewController> {
  const AppointmentPreviewMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(""),
      body: Obx(() => controller.isLoading ? Loader() : _bodyWidget(context)),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [Preview(), PaymentMethod(), Button()],
      ),
    );
  }
}

part of 'appointment_preview_screen.dart';

class AppointmentPreviewTabletScreen extends GetView<AppointmentPreviewController> {
  const AppointmentPreviewTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('AppointmentPreview Tablet Screen'),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [],
      ),
    );
  }
}

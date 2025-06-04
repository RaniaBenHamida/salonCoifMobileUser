part of 'salon_details_screen.dart';

class SalonDetailsTabletScreen extends GetView<SalonDetailsController> {
  const SalonDetailsTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('SalonDetails Tablet Screen'),
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

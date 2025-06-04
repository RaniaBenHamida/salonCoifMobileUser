part of 'schedule_screen.dart';

class ScheduleMobileScreen extends GetView<SalonDetailsController> {
  const ScheduleMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(Strings.schedule),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Schedule(),
          CheckoutButton(),
          Sizes.height.v10,
        ],
      ),
    );
  }
}

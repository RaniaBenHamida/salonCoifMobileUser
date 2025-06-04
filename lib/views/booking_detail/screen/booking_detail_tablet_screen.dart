part of 'booking_detail_screen.dart';

class BookingDetailTabletScreen extends GetView<BookingDetailController> {
  const BookingDetailTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('BookingDetail Tablet Screen'),
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

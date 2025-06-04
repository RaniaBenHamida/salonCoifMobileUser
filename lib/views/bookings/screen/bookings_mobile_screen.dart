part of 'bookings_screen.dart';

class BookingsMobileScreen extends GetView<BookingsController> {
  const BookingsMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Strings.bookings,
        showBackButton: false,
      ),
      body: Obx(() => controller.isLoading ? Loader() : _bodyWidget(context)),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        color: CustomColor.primary,
        onRefresh: () async {
          controller.myBookingsApi();
        },
        child: CustomScrollView(
          /// wrap with SliverToBoxAdapter() in every child in slivers
          slivers: [SliverToBoxAdapter(child: HistoryWidget())],
        ),
      ),
    );
  }
}

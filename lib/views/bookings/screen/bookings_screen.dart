import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beautyTn/base/utils/no_data_widget.dart';
import '../../../base/utils/basic_import.dart';
import '../../../base/utils/loader.dart';
import '../controller/bookings_controller.dart';
import '../widget/history_tiles.dart';
part 'bookings_tablet_screen.dart';
part 'bookings_mobile_screen.dart';
part '../widget/history_widget.dart';

class BookingsScreen extends GetView<BookingsController> {
  const BookingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: BookingsMobileScreen(),
      tablet: BookingsTabletScreen(),
    );
  }
}

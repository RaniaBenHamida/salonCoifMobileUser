import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beautyTn/views/bookings/controller/bookings_controller.dart';
import '../../../base/utils/basic_import.dart';
import '../../../base/widgets/added/custom_cached_image_widget.dart';
import '../../../base/widgets/added/icon_text_widget.dart';
import '../../../base/widgets/double_side_text_widget.dart';
import '../controller/booking_detail_controller.dart';
part 'booking_detail_tablet_screen.dart';
part 'booking_detail_mobile_screen.dart';
part '../widget/salon_image.dart';
part '../widget/parlour_information.dart';
part '../widget/service_information.dart';
part '../widget/schedule_information.dart';
part '../widget/payment_information.dart';
part '../widget/back_button_widget.dart';

class BookingDetailScreen extends GetView<BookingDetailController> {
  const BookingDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: BookingDetailMobileScreen(),
      tablet: BookingDetailTabletScreen(),
    );
  }
}

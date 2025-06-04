part of '../screen/booking_detail_screen.dart';

class ServiceInformation extends GetView<BookingDetailController> {
  const ServiceInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Sizes.height.v10,
        IconTextWidget(
          icon: Icons.person_2_outlined,
          text: Strings.serviceInformation,
        ),
        Sizes.height.v10,
        DoubleSideTextWidget(keys: Strings.serviceName, value: controller.data.service.join(", "), needDivider: false),
      ],
    );
    
  
  }
}

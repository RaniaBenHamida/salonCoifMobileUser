part of '../screen/booking_detail_screen.dart';

class ParlourInformation extends GetView<BookingDetailController> {
  const ParlourInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconTextWidget(
          icon: Icons.person_2_outlined,
          text: Strings.parlourDetails,
        ),
        Sizes.height.v10,
        DoubleSideTextWidget(keys: Strings.parlourName, value: controller.data.parlour.name, needDivider: false),
        DoubleSideTextWidget(keys: Strings.contact, value: controller.data.parlour.contact, needDivider: false),
        DoubleSideTextWidget(keys: Strings.address, value: controller.data.parlour.address, needDivider: false),
      ],
    );
  }
}

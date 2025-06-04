part of '../screen/booking_detail_screen.dart';

class ScheduleInformation extends GetView<BookingDetailController> {
  const ScheduleInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Sizes.height.v10,
        IconTextWidget(
          icon: Icons.person_2_outlined,
          text: Strings.scheduleInformation,
        ),
        Sizes.height.v10,
        DoubleSideTextWidget(keys: Strings.date, value: controller.data.date, needDivider: false),
        DoubleSideTextWidget(keys: Strings.time, value: controller.data.schedule.fromTime + " - " + controller.data.schedule.toTime, needDivider: false),
        DoubleSideTextWidget(keys: Strings.serialNumber, value: controller.data.serialNumber.toString(), needDivider: false),
      ],
    );
  }
}

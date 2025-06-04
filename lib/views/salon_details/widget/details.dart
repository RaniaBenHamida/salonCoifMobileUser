part of '../screen/salon_details_screen.dart';

class Details extends GetView<SalonDetailsController> {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = controller.salonInfo;
    return Container(
      child: Column(
        children: [
          IconTextWidget(
            icon: Icons.person_2_outlined,
            text: Strings.parlourDetails,
          ),
          Sizes.height.v10,
          DoubleSideTextWidget(keys: Strings.parlourName, value: data.name, needDivider: false),
          DoubleSideTextWidget(keys: Strings.parlourAddress, value: data.address, needDivider: false),
          DoubleSideTextWidget(keys: Strings.experience, value: data.experience, needDivider: false),
        ],
      )
    );
  }
}

part of '../screen/salon_details_screen.dart';

class Service extends GetView<SalonDetailsController> {
  const Service({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.easeInCubic,
        child: Column(
          children: [
            Sizes.height.v10,
            IconTextWidget(
              icon: Icons.done_outline,
              text: Strings.serviceSelect,
            ),
            Sizes.height.v10,
            Sizes.width.v5,
            Sizes.width.v5,
            _wrapWidget(context),
            Sizes.height.v5,
          ],
        ));
  }

  Widget _wrapWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
          controller.serviceAndScheduleModel.data.parlourHasService.length,
          (index) {
        final service =
            controller.serviceAndScheduleModel.data.parlourHasService[index];

        return GestureDetector(
          onTap: () {
            controller.showTimes.value = false;
            controller.selectedTimesIndexes.value = (-1);
            controller.selectedDate.value = Strings.selectDate;

            if (controller.selectedServicesIndexes.contains(index)) {
              controller.selectedServicesIndexes.remove(index);
              controller.totalPrice.value -= double.parse(service.price);
              controller.serviceList.remove(service.serviceName);
            } else {
              controller.selectedServicesIndexes.add(index);
              controller.totalPrice.value += double.parse(service.price);
              controller.serviceList.add(service.serviceName);
            }

            controller.showSchedule.value =
                controller.selectedServicesIndexes.isNotEmpty;
          },

          child: Obx(() {
            bool isSelected =
                controller.selectedServicesIndexes.contains(index);

            return Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context).primaryColor.withOpacity(0.2)
                    : Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : Colors.grey.shade300,
                  width: 2.0,

                ),
              ),
              child: Row(
                children: [
                  // Duration Container
                  Icon(
                    Icons.check_circle,
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.grey.shade400,
                    size: Dimensions.iconSizeLarge,
                  ),
                  Sizes.width.v10,
                  // Service Name (Centered)
                  Expanded(
                    child: TextWidget(
                      service.serviceName,
                      typographyStyle: TypographyStyle.titleSmall,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  // Price (Right Aligned)
                  TextWidget(
                    "\ TND ${double.parse(service.price).toStringAsFixed(2)}",
                    typographyStyle: TypographyStyle.titleSmall,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            );
          }),
        );
      }),
    );
  }
}

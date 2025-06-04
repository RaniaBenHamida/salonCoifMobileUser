part of '../screen/schedule_screen.dart';

class Schedule extends GetView<SalonDetailsController> {
  const Schedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.easeInCubic,
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.horizontalSize,
            vertical: Dimensions.verticalSize * 0.4),
        child: Obx(() => Column(
              children: [
                Sizes.height.v10,
                _dateWidget(),
                Sizes.height.v10,
                !controller.showTimes.value
                    ? SizedBox.shrink()
                    : AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOut,
                        child: Column(
                          crossAxisAlignment: crossStart,
                          children: [
                            Sizes.height.v5,
                            TextWidget(Strings.selectTime,
                                style: Theme.of(context).textTheme.bodySmall,
                                fontWeight: FontWeight.bold),
                            Sizes.height.v5,
                            _wrapWidget(context),
                            Sizes.height.v10,
                          ],
                        ),
                      ),
                PrimaryInputWidget(
                  controller: controller.messageController,
                  skipEnterText: true,
                  hintText: Strings.writeHere,
                  label: Strings.message,
                  optionalText: Strings.optional,
                  maxLines: 4,
                ),
                // Sizes.height.v10,
              ],
            )));
  }

  _wrapWidget(BuildContext context) {
    return Obx(
      () => Wrap(
        alignment: WrapAlignment.start,
        spacing: 10.0, // Space between items horizontally
        runSpacing: 10.0, // Space between rows
        children: List.generate(
            // controller.serviceAndScheduleModel.data.parlourHasSchedule.length,
            controller.filteredScheduleList.length, (index) {
          final times = controller.filteredScheduleList[index];

          return GestureDetector(
              onTap: () {
                if (controller.selectedTimesIndexes.value.isEqual(index) ||
                    times.status == 0 ||
                    times.maxClient == 0) {
                  controller.selectedTimesIndexes.value = -1;
                  controller.selectedTimeId.value = "";
                  controller.selectedTime = "";
                } else {
                  controller.selectedTimesIndexes.value = index;
                  controller.selectedTimeId.value = times.id.toString();
                  controller.selectedTime =
                      "${times.fromTime} - ${times.toTime}";
                }
              },
              child: Opacity(
                opacity: times.status == 0 ? .6 : 1,
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      0.4, // Adjusts width of each item
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 0.5,
                        color:
                            controller.selectedTimesIndexes.value.isEqual(index)
                                ? CustomColor.primary
                                : CustomColor.blackColor),
                    color: controller.selectedTimesIndexes.value.isEqual(index)
                        ? Theme.of(context).primaryColor.withValues(alpha: .1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(Dimensions.radius * .8),
                  ),
                  child: Row(
                    mainAxisAlignment: mainCenter,
                    crossAxisAlignment: crossStart,
                    children: [
                      Sizes.width.v5,
                      Flexible(
                        child: TextWidget("${times.fromTime} - ${times.toTime}",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium),
                      ),
                    ],
                  ),
                ),
              ));
        }),
      ),
    );
  }

  _dateWidget() {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Obx(() => TextWidget(controller.selectedDate.value)),
        Container(
          height: 70.h,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: List.generate(controller.dates.length, (index) {
              final parts = controller.dates[index].split(" ");
              final date = controller.dates[index];
              bool isSelected = controller.selectedDate.value == date;
              return GestureDetector(
                onTap: () {
                  controller.selectedDate.value = date;
                  controller.showTimes.value = true;
                  controller.setTime();
                },
                child: Card(
                  margin: EdgeInsets.symmetric(
                      vertical: Dimensions.heightSize,
                      horizontal: Dimensions.widthSize * 0.5),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.horizontalSize * 0.6,
                      vertical: Dimensions.verticalSize * 0.05,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius),
                        border: Border.all(
                          width: 0.5,
                          color: isSelected
                              ? CustomColor.primary
                              : CustomColor.blackColor,
                        )),
                    child: Column(
                      mainAxisAlignment: mainCenter,
                      children: [
                        TextWidget(
                          parts[1],
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? CustomColor.primary
                              : CustomColor.blackColor,
                          typographyStyle: TypographyStyle.labelMedium,
                        ),
                        TextWidget(
                          parts[0],
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? CustomColor.primary
                              : CustomColor.blackColor,
                          typographyStyle: TypographyStyle.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}

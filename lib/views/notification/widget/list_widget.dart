part of '../screen/notification_screen.dart';

class ListWidget extends GetView<NotificationController> {
  const ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.builder(
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.verticalSize * 0.42,
            ),
            itemCount: controller.notifications.length,
            itemBuilder: (context, index) {
              return TileWidget(index: index);
            }));
  }
}
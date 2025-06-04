part of '../screen/notification_screen.dart';

class TileWidget extends GetView<NotificationController> {
  final int index;
  const TileWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = controller.notifications[index];
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(
        left: Dimensions.horizontalSize * 0.8,
        right: Dimensions.horizontalSize * 0.8,
        top: Dimensions.verticalSize * 0.67,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.horizontalSize * 0.6,
          vertical: Dimensions.verticalSize * 0.4,
        ),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            Row(
              mainAxisAlignment: mainSpaceBet,
              children: [
                CircleAvatar(
                  radius: Dimensions.radius * 2.4,
                  backgroundColor: CustomColor.disableColor,
                  backgroundImage: data.parlour.image.isNotEmpty
                      ? NetworkImage(
                          "${controller.imagePath.value}/${data.parlour.image}")
                      : NetworkImage(
                          "${controller.notificationModel.data.imagePath.baseUrl}/${controller.notificationModel.data.imagePath.defaultImage}"),
                ),
                Sizes.width.v20,
                Expanded(
                  child: TextWidget(
                    data.parlour.name,
                    fontWeight: FontWeight.bold,
                    typographyStyle: TypographyStyle.titleSmall,
                  ),
                ),
                TextWidget(
                  timeAgo(data.createdAt),
                  typographyStyle: TypographyStyle.labelLarge,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: mainEnd,
              children: [
                Sizes.width.v5,
                TextWidget(
                  data.service.join(", "),
                  typographyStyle: TypographyStyle.labelLarge,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: mainSpaceBet,
              children: [
                Column(
                  children: [
                    TextWidget(
                        "${double.parse(data.payablePrice).toStringAsFixed(2)} USD"),
                  ],
                ),
                Sizes.width.v5,
                TextWidget(
                  "${data.date}",
                  typographyStyle: TypographyStyle.labelLarge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String timeAgo(DateTime createdAt) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(createdAt);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 365) {
      return '${difference.inDays ~/ 30} months ago';
    } else {
      return '${difference.inDays ~/ 365} years ago';
    }
  }
}

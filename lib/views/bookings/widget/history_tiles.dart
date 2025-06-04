// part of '../screen/bookings_screen.dart';

// class HistoryTiles extends GetView<BookingsController> {
//   const HistoryTiles(this.data, {Key? key}) : super(key: key);

//   final Datum data;

//   @override
//   Widget build(BuildContext context) {
//     RxBool isVisible = false.obs;
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: Dimensions.paddingSize * .4,
//         vertical: Dimensions.paddingSize * .2,
//       ),
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: CustomColor.blackColor.withValues(alpha: .1),
//           width: 2,
//           strokeAlign: 1
//         ),
//           borderRadius: BorderRadius.circular(Dimensions.radius * .6),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.white.withValues(alpha: 1),
//                 blurRadius: 2,
//                 spreadRadius: 2)
//           ]),
//       child: Column(
//         children: [
//           InkWell(
//             onTap: () {
//               // isVisible.value = !isVisible.value;
//               // debugPrint(isVisible.value.toString());
//             },
//             child: Row(
//               children: [
//                 CustomCachedImageWidget(
//                     height: 60,
//                     width: 60,
//                     shape: BoxShape.circle,
//                     image: data.parlour.image == null
//                         ? controller.myBookingsModel.data.imagePath.baseUrl +
//                             "/" +
//                             controller
//                                 .myBookingsModel.data.imagePath.defaultImage
//                         : controller.myBookingsModel.data.imagePath.baseUrl +
//                             "/" +
//                             controller
//                                 .myBookingsModel.data.imagePath.pathLocation +
//                             "/" +
//                             data.parlour.image),
//                 Sizes.width.v5,
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: crossStart,
//                     children: [
//                       TextWidget(data.parlour.name),
//                       Sizes.height.v5,
//                       Row(
//                         children: [
//                           TextWidget(data.date,
//                               style: Theme.of(context).textTheme.bodySmall),
//                           Spacer(),
//                           Sizes.width.v5,
//                           Container(
//                             padding:
//                                 EdgeInsets.all(Dimensions.paddingSize * .2),
//                             decoration: BoxDecoration(
//                                 color: data.parlour.status.isEqual(1)
//                                     ? CustomColor.selected
//                                     : CustomColor.rejected,
//                                 shape: BoxShape.circle),
//                           ),
//                           Sizes.width.v5,
//                           TextWidget(
//                               data.parlour.status.isEqual(1)
//                                   ? Strings.success
//                                   : Strings.rejected,
//                               style: Theme.of(context).textTheme.bodySmall),
//                         ],
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Obx(() => Column(
//                 children: [
//                   Sizes.height.v10,
//                   Container(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: Dimensions.paddingSize * .4,
//                       vertical: Dimensions.paddingSize * .2,
//                     ),
//                     decoration: BoxDecoration(
//                         borderRadius:
//                             BorderRadius.circular(Dimensions.radius * .6),
//                         color: Colors.grey.withValues(alpha: .3)),
//                     child: Column(
//                       children: [
//                         Sizes.height.v5,
//                         DoubleSideTextWidget(
//                           keys: Strings.serviceName,
//                           value: data.service.join(', '),
//                         ),
//                         DoubleSideTextWidget(
//                           keys: Strings.serialNumber,
//                           value: data.serialNumber.toString(),
//                         ),
//                         // DoubleSideTextWidget(
//                         //   keys: Strings.date,
//                         //   // value: DateFormat('dd MMMM, yyyy').format(data.schedule.createdAt),
//                         //   value: data.date,
//                         // ),
//                         DoubleSideTextWidget(
//                           keys: Strings.time,
//                           value: data.schedule.fromTime +
//                               "-" +
//                               data.schedule.toTime,
//                         ),
//                         DoubleSideTextWidget(
//                           needDivider: isVisible.value,
//                           keys: Strings.price,
//                           value:
//                               '${double.parse(data.price).toStringAsFixed(2)} ${data.paymentCurrency.isEmpty ? controller.myBookingsModel.data.curCode : data.paymentCurrency}',
//                         ),

//                         AnimatedContainer(
//                           duration: Duration(milliseconds: 200),
//                           height: isVisible.value ? Dimensions.buttonHeight : 0,
//                           child: FutureBuilder(
//                             future: Future.delayed(Duration(milliseconds: 200)),
//                             builder: (context, snap) {
//                               if (snap.connectionState == ConnectionState.waiting) {
//                                 return const Text('Loading...');
//                               }
//                               return Visibility(
//                                 visible: isVisible.value,
//                                 child: Column(
//                                   children: [
//                                     DoubleSideTextWidget(
//                                       keys: Strings.paymentMethod,
//                                       value: data.paymentMethod,
//                                     ),
//                                     DoubleSideTextWidget(
//                                       keys: Strings.payableAmount,
//                                       value:
//                                       '${double.parse(data.payablePrice).toStringAsFixed(2)} ${data.paymentCurrency.isEmpty ? controller.myBookingsModel.data.curCode : data.paymentCurrency}',
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             }
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Spacer(),
// TextButton(
//     onPressed: () {
//       // isVisible.value = !isVisible.value;
//       Get.toNamed(Routes.bookingDetailScreen, arguments: [data]);
//     },
//     child: TextWidget(
//         isVisible.value
//             ? Strings.hide
//             : Strings.showDetails,
//         typographyStyle: TypographyStyle.labelSmall,
//         color: CustomColor.primary))
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ))
//         ],
//       ),
//     );
//   }
// }
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../base/utils/basic_import.dart';
import '../../../base/widgets/divider.dart';
import '../../../base/widgets/double_side_text_widget.dart';
import '../../../routes/routes.dart';
import '../controller/bookings_controller.dart';

class HistoryTiles extends StatefulWidget {
  final VoidCallback? onTap;
  final Color? color;
  final bool showPreview;
  final int index;

  const HistoryTiles(
      {super.key,
      this.onTap,
      this.color,
      this.showPreview = true,
      required this.index});

  @override
  State<HistoryTiles> createState() => _HistoryTilesState();
}

class _HistoryTilesState extends State<HistoryTiles> {
  final controller = Get.put(BookingsController());
  bool _showDetails = false;
  late var data = controller.bookingsList[widget.index];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 2)),
          margin: EdgeInsets.zero,
          elevation: 0,
          child: ListTile(
            onTap: () {
              setState(() {
                _showDetails = !_showDetails;
                // controller.parlourId.value = data.id;
              });
            },
            tileColor: widget.color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 2)),
            // contentPadding: EdgeInsets.zero,
            minTileHeight: Dimensions.heightSize * 7,
            leading: Container(
              decoration: BoxDecoration(
                  // borderRadius: (Dimensions.radius * 0.8).radiusEx,
                  color: const Color(0xffF5F5F5),
                  shape: BoxShape.circle),
              // padding: Dimensions.verticalSize.edgeVertical * 0.15,
              child: CircleAvatar(
                radius: Dimensions.radius * 2.4,
                backgroundColor: CustomColor.disableColor,
                backgroundImage: data.parlour.image.isNotEmpty
                    ? NetworkImage(
                        "${controller.imagePath.value}/${controller.pathLocation}/${data.parlour.image}")
                    : NetworkImage(
                        '${controller.imagePath.value}/${controller.myBookingsModel.data.imagePath.defaultImage}'),
              ),
            ),
            title: Column(
              crossAxisAlignment: crossStart,
              mainAxisAlignment: mainSpaceBet,
              children: [
                TextWidget(
                  data.parlour.name,
                  typographyStyle: TypographyStyle.titleSmall,
                  fontWeight: FontWeight.bold,
                ),
                // Sizes.height.v10,
                Row(
                  crossAxisAlignment: crossCenter,
                  children: [
                    getStatusColor(data.status),
                    Sizes.width.v5,
                    TextWidget(
                      getStatusText(data.status),
                      typographyStyle: TypographyStyle.bodySmall,
                      colorShade: ColorShade.mediumForty,
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
            trailing: Column(
              crossAxisAlignment: crossEnd,
              mainAxisAlignment: mainCenter,
              children: [
                TextWidget(
                  formatDate(data.date),
                  typographyStyle: TypographyStyle.titleSmall,
                  fontWeight: FontWeight.bold,
                ),
                // Sizes.height.v10,
                TextWidget(
                  "${data.schedule.fromTime}-${data.schedule.toTime}",
                  typographyStyle: TypographyStyle.bodySmall,
                  colorShade: ColorShade.mediumForty,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
        if (widget.showPreview && _showDetails)
          AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: _showDetails ? 1.00 : 0.0,
            child: AnimatedSlide(
              offset: _showDetails ? Offset(0, 0) : Offset(0, 1),
              duration: Duration(milliseconds: 300),
              curve: Curves.elasticInOut,
              child: _buildCard(context),
            ),
          )
      ],
    );
  }

  Widget _buildCard(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius * 2),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.horizontalSize,
          vertical: Dimensions.verticalSize * 0.7,
        ),
        child: Column(
          children: [
            _buildInfoRow(Strings.serviceType, data.service.join(', ')),
            _buildDivider(),
            _buildInfoRow(Strings.time,
                "${data.schedule.fromTime}-${data.schedule.toTime}"),
            _buildDivider(),
            _buildInfoRow(Strings.price,
                double.parse(data.payablePrice).toStringAsFixed(2)),
            _buildDivider(),
            _buildInfoRow(Strings.serialNumber, data.serialNumber.toString()),
            _buildDivider(),
            _assignStuffWidget('', context)
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String key, String value) {
    return DoubleSideTextWidget(
      keys: key,
      value: value,
    );
  }

  Widget _buildDivider() {
    return DividerWidget(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.verticalSize * 0.2,
      ),
    );
  }

  _assignStuffWidget(String keys, BuildContext context) {
    return DoubleSideTextWidget(
        keys: keys,
        value: '',
        rightWidget: Expanded(
          child: TextButton(
              onPressed: () {
                // isVisible.value = !isVisible.value;
                Get.toNamed(Routes.bookingDetailScreen, arguments: [data]);
              },
              child: TextWidget(Strings.showDetails,
                  typographyStyle: TypographyStyle.labelSmall,
                  color: CustomColor.primary)),
        ));
  }

  String getStatusText(int status) {
    switch (status) {
      case 3:
        return 'Hold';
      case 2:
        return 'Pending';
      case 1:
        return 'Success';
      case 4:
        return 'In Progress';
      default:
        return 'Unknown Status';
    }
  }

  Widget getStatusColor(int status) {
    switch (status) {
      case 3:
        return Icon(
          Icons.circle,
          size: Dimensions.iconSizeSmall,
          color: CustomColor.rejected,
        );
      case 2:
        return Icon(
          Icons.circle,
          size: Dimensions.iconSizeSmall,
          color: CustomColor.pending,
        );
      case 1:
        return Icon(
          Icons.circle,
          size: Dimensions.iconSizeSmall,
          color: CustomColor.selected,
        );
      case 4:
        return Icon(
          Icons.circle,
          size: Dimensions.iconSizeSmall,
          color: CustomColor.ongoing,
        );
      default:
        return Icon(
          Icons.circle,
          size: Dimensions.iconSizeSmall,
          color: Colors.grey,
        );
    }
  }

  String formatDate(String inputDate) {
    inputDate = inputDate.replaceAll(",", "");

    DateTime parsedDate;
    try {
      parsedDate = DateFormat("dd MMMM yyyy").parse(inputDate);
    } catch (e) {
      try {
        parsedDate = DateFormat("dd MMM yyyy").parse(inputDate);
      } catch (e) {
        return "Invalid date"; // Handle error if format is unexpected
      }
    }

    return DateFormat("dd MMM").format(parsedDate);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../base/utils/basic_import.dart';
import '../base/widgets/title_sub_title_widget.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen(
      {super.key,
        required this.msg,
        this.title = "",
        this.path = "",
        this.isDialog = false,
        required this.onTap, this.widget});

  final String msg, title, path;
  final VoidCallback onTap;
  final bool isDialog;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return isDialog ? _body(context): Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: mainCenter,
        children: [
          Container(
            padding: EdgeInsets.all(Dimensions.paddingSize * .7),
            margin: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSize * .7,
              vertical: Dimensions.paddingSize * 2,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius * 2),
                color: Get.isDarkMode ? CustomColor.blackColor : CustomColor.whiteColor,
                boxShadow: [
                  BoxShadow(
                      color: CustomColor.primary.withValues(alpha: .2),
                      spreadRadius: 1,
                      blurRadius: 5
                  )
                ]
            ),
            child: Column(
              mainAxisAlignment: mainCenter,
              mainAxisSize: mainMin,
              children: [
                // Sizes.height.v40,
                // Sizes.height.v40,

                SvgPicture.asset(
                  path.isEmpty ? "assets/icons/success.svg" : path,
                  color: CustomColor.primary,
                  height: 200,
                  width: 200,
                ),

                Sizes.height.v20,
                TitleSubTitleWidget(
                    showImage: false,
                    title: title.isEmpty ? Strings.confirm : title,
                    subTitle: msg,
                    isCenterText: true),
                Sizes.height.v10,
                widget ?? Sizes.height.v20,
                Sizes.height.v20,
                PrimaryButton(
                    title: Strings.continueText, onPressed: onTap, disable: false),
                // Sizes.height.v30,
              ],
            ),
          ),
        ],
      ),
    );
  }



}
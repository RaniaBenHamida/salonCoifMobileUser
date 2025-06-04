import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beautyTn/base/themes/token.dart';

import '../utils/custom_style.dart';


class RichTextButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final AlignmentGeometry align;
  final String preText, buttonText;
  const RichTextButtonWidget(
      {super.key,
      required this.onTap,
      required this.preText,
      required this.buttonText,
      this.align = Alignment.center});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align,
      child: Opacity(
        opacity: .8,
        child: RichText(
          text: TextSpan(
            text: (preText),
            style: CustomStyle.bodySmall.copyWith(
              color: (Get.isDarkMode ? CustomColor.whiteColor : CustomColor.blackColor)
            ),
            children: <TextSpan>[
              TextSpan(
                text: "  ${(buttonText)}  ",
                recognizer: TapGestureRecognizer()..onTap = onTap,
                style: CustomStyle.bodySmall.copyWith(
                  color: CustomColor.primary
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

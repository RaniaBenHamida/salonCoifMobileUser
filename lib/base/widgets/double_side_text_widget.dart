import 'package:flutter/material.dart';
import 'package:beautyTn/base/utils/basic_import.dart';

class DoubleSideTextWidget extends StatelessWidget {
  DoubleSideTextWidget(
      {required this.keys,
      required this.value,
      this.rightWidget,
      this.image = '',
      this.keyStyle = TypographyStyle.labelSmall,
      this.valueStyle = TypographyStyle.labelSmall,
      this.fontWeight,
      this.needDivider = false});
  final String keys, value;
  final TypographyStyle keyStyle;
  final TypographyStyle valueStyle;
  final FontWeight? fontWeight;
  final String image;
  final Widget? rightWidget;
  final bool needDivider;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: Dimensions.verticalSize * 0.16),
          child: Row(
            crossAxisAlignment: crossStart,
            children: [
              if (image != '')
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(Dimensions.paddingSize * 0.45),
                      decoration: BoxDecoration(
                        color: CustomColor.background,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(image),
                        ),
                      ),
                    ),
                    Sizes.width.v5,
                  ],
                ),
              TextWidget(
                keys,
                typographyStyle: keyStyle,
                fontWeight: fontWeight,
              ),
              Sizes.width.v5,
              rightWidget ??
                  Expanded(
                    child: TextWidget(
                      value,
                      typographyStyle: valueStyle,
                      fontWeight: fontWeight,
                      textAlign: TextAlign.end,
                    ),
                  ),
            ],
          ),
        ),
        !needDivider
            ? SizedBox.shrink()
            : Divider(
                // height: 3,
                thickness: 1,
                color: Colors.grey,
              ),
      ],
    );
  }
}

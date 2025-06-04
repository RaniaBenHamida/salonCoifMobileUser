// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:beautyTn/base/utils/basic_import.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: (Dimensions.radius * 0.8).radiusEx,
              color: Color(0xffF5F5F5),
            ),
            padding: Dimensions.verticalSize.edgeVertical * 0.2,
            child: Column(
              mainAxisSize: mainMin,
              mainAxisAlignment: mainCenter,
              children: [
                TextWidget(
                  '12',
                  fontSize: Dimensions.titleLarge * 0.7,
                  padding: Dimensions.horizontalSize.edgeHorizontal * 0.6,
                  fontWeight: FontWeight.bold,
                ),
                TextWidget(
                  'FEB',
                  typographyStyle: TypographyStyle.labelMedium,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          title: Column(
            crossAxisAlignment: crossStart,
            mainAxisAlignment: mainSpaceBet,
            children: [
              const TextWidget(
                'Add Money',
                typographyStyle: TypographyStyle.titleSmall,
                fontWeight: FontWeight.bold,
              ),
              // Sizes.height.v10,
              const TextWidget(
                '#TRX213654896354',
                typographyStyle: TypographyStyle.titleSmall,
                colorShade: ColorShade.mediumForty,
                maxLines: 1,
              ),
            ],
          ),
          trailing: const TextWidget(
            '120 USD',
            typographyStyle: TypographyStyle.titleSmall,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(
          color: Color(0xffF5F5F5),
        ),
      ],
    );
  }
}

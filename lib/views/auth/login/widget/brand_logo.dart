import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/api/services/basic_services.dart';
import '../../../../base/utils/dimensions.dart';

class BrandLogo extends StatelessWidget {
  const BrandLogo(
      {super.key,
      this.isDarkLogo = false,
      this.scale,
      this.edgeInsets,
      this.height});
  final bool isDarkLogo;
  final EdgeInsets? edgeInsets;
  final double? scale;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Container(
        // alignment: Alignment.centerLeft,
        margin: edgeInsets ?? EdgeInsets.only(bottom: Dimensions.verticalSize),
        child: Image.asset(
          "assets/logo/basic_logo_dark.png",
          height: 100,
          scale: scale ?? 1.0,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

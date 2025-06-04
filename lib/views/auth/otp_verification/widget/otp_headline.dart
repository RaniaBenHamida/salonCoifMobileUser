import 'package:flutter/material.dart';

import '../../../../base/utils/dimensions.dart';
import '../../../../base/widgets/title_sub_title_widget.dart';
import '../../../../languages/strings.dart';

class OtpHeadlineWidget extends StatelessWidget {
  const OtpHeadlineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.verticalSize * 0.413,
        bottom: Dimensions.verticalSize * 1.3,
      ),
      child: TitleSubTitleWidget(
        title: Strings.pleaseEnterTheCode,
        subTitle: Strings.enterTheOtpVerification,
      ),
    );
  }
}

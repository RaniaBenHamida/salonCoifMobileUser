import 'package:flutter/material.dart';

import '../../../../base/utils/dimensions.dart';
import '../../../../base/widgets/title_sub_title_widget.dart';
import '../../../../languages/strings.dart';

class EmailVerifyHeadlineWidget extends StatelessWidget {
  const EmailVerifyHeadlineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.verticalSize * 0.413,
        bottom: Dimensions.verticalSize * 0.6,
      ),
      child: TitleSubTitleWidget(
        title: Strings.pleaseEnterTheCode,
        subTitle: Strings.enterTheOtpVerification,
      ),
    );
  }
}

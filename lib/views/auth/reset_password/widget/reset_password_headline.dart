import 'package:flutter/material.dart';

import '../../../../base/utils/dimensions.dart';
import '../../../../base/widgets/title_sub_title_widget.dart';
import '../../../../languages/strings.dart';

class ResetPasswordHeadline extends StatelessWidget {
  const ResetPasswordHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.verticalSize * 0.413,
      ),
      child: TitleSubTitleWidget(
        title: Strings.resetPassword,
        subTitle: Strings.nowYouAreAble,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../base/utils/basic_import.dart';

class LanguageProgressIndicator extends StatelessWidget {
  const LanguageProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.sizeOf(context).height * 0.2,
          left: MediaQuery.sizeOf(context).width * 0.15,
          right: MediaQuery.sizeOf(context).width * 0.15,
        ),
        child: LinearProgressIndicator(
          color: CustomColor.primary.withOpacity(0.8),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}

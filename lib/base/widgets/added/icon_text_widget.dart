import 'package:flutter/material.dart';
import 'package:beautyTn/base/utils/basic_import.dart';

class IconTextWidget extends StatelessWidget {
  const IconTextWidget({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // Icon(icon),
            // Sizes.width.v5,
            TextWidget(text, fontWeight: FontWeight.bold)
          ],
        ),
        Sizes.height.v5,
        Divider(
          height: 1,
          color: Colors.grey.withValues(alpha: .6),
        )
      ],
    );
  }
}

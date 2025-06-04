import 'package:flutter/material.dart';

import '../../../base/utils/basic_import.dart';
import 'bottom_item.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: CustomColor.whiteColor,
      padding: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      height: Dimensions.heightSize * 6,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      elevation: 5,
      shadowColor: CustomColor.blackColor.withOpacity(0.6),
      child: Row(
        mainAxisAlignment: mainSpaceBet,
        children: [
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.only(left: 0.5, top: Dimensions.paddingSize * 0),
              child: BottomItem(
                icon: Icons.home_rounded,
                label: Strings.home,
                index: 0,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: Dimensions.paddingSize * 0),
              child: BottomItem(
                icon: Icons.query_stats_rounded,
                label: Strings.find,
                index: 1,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: Dimensions.paddingSize * 0),
              child: BottomItem(
                icon: Icons.calendar_month_outlined,
                label: Strings.bookings,
                index: 2,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: Dimensions.paddingSize * 0,
                left: Dimensions.paddingSize * 0.5,
              ),
              child: BottomItem(
                icon: Icons.person_2_rounded,
                label: Strings.profile,
                index: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

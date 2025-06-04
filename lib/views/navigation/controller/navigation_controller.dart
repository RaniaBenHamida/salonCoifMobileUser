import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../bookings/screen/bookings_screen.dart';
import '../../dashboard/screen/dashboard_screen.dart';
import '../../find/screen/find_screen.dart';
import '../../profile/screen/profile_screen.dart';

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;

  List<Widget> bodyPages = [
    DashboardScreen(),
    FindScreen(),
    BookingsScreen(),
    ProfileScreen(),
  ];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}

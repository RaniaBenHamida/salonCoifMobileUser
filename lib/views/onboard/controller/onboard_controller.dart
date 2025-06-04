import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final pageController = PageController();

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

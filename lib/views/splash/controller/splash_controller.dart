import 'dart:async';

import 'package:get/get.dart';

import '../../../base/api/services/basic_services.dart';
import '../../../base/utils/local_storage.dart';
import '../../../routes/routes.dart';

class SplashController extends GetxController {

  @override
  void onReady() {
    super.onReady();

    Future.delayed(Duration(seconds: 5)).then((v){
      LocalStorage.isLoggedIn
          ? Get.offAndToNamed(Routes.navigation)
          : LocalStorage.onboardSave
          ? Get.offAndToNamed(Routes.loginScreen)
          : BasicServices.onboardScreen.isEmpty ? Get.offAndToNamed(Routes.loginScreen) : Get.offAndToNamed(Routes.loginScreen);
    });
  }
}

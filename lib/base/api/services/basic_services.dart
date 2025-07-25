import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../views/auth/auth_model/basic_settings_model.dart';
import '../../themes/model.dart';
import '../../utils/basic_import.dart';
import '../endpoint/api_endpoint.dart';
import '../method/request_process.dart';

class BasicServices {
  // Basic Info
  static final List<OnboardScreen> onboardScreen = [];
  static RxString splashImage = ''.obs;
  static RxString appBasicLogoWhite = ''.obs;
  static RxString appBasicLogoDark = ''.obs;
  static RxString appLauncher = ''.obs;
  static RxString privacyPolicy = ''.obs;
  static RxString contactUs = ''.obs;
  static RxString aboutUs = ''.obs;
  static RxString basePath = ''.obs;
  static RxString pathLocation = ''.obs;
  static RxString siteName = ''.obs;
  static RxInt userRegistration = (1).obs;
  static RxInt agreePolicy = (1).obs;
  static RxString baseColor = ''.obs;
  // static List<Country> countryList = [];
  static final _isLoading = false.obs;
  static bool get isLoading => _isLoading.value;
  static late BasicSettingsModel _basicSettingsModel;
  static BasicSettingsModel get basicSettingsModel => _basicSettingsModel;
  static Future<BasicSettingsModel?> getBasicSettingsInfo() async {
    return RequestProcess().request<BasicSettingsModel>(
      fromJson: BasicSettingsModel.fromJson,
      apiEndpoint: ApiEndpoint.basicSettings,
      isLoading: _isLoading,
      showSuccessMessage: false,
      onSuccess: (value) {
        _basicSettingsModel = value!;
        onboardScreen.clear();
        basePath.value = _basicSettingsModel.data.appImagePaths.baseUrl;
        pathLocation.value =
            _basicSettingsModel.data.appImagePaths.cleanedPathLocation;
        var splash = _basicSettingsModel.data.splashScreen.splashScreenImage;
        debugPrint(_basicSettingsModel.data.splashScreen.splashScreenImage);
        // splash
        splashImage.value = "${basePath.value}/${pathLocation.value}/$splash";
        debugPrint(splashImage.value);
        // onboard
        // for (var element in _basicSettingsModel.data.onboardScreens) {
        //   onboardScreen.add(
        //     OnboardScreen(
        //         title: element.title,
        //         image:
        //             "${basePath.value}/${pathLocation.value}/${element.image}",
        //         status: element.status),
        //   );
        // }

        privacyPolicy.value = _basicSettingsModel.data.webLinks.privacyPolicy;
        contactUs.value = _basicSettingsModel.data.webLinks.contactUs;
        aboutUs.value = _basicSettingsModel.data.webLinks.aboutUs;

        // Site Logo
        var imagePaths = _basicSettingsModel.data.imagePaths;
        var siteLogo = _basicSettingsModel.data.basicSettings.siteLogo;
        var siteLogoDark = _basicSettingsModel.data.basicSettings.siteLogoDark;
        baseColor.value = _basicSettingsModel.data.basicSettings.baseColor;
        siteName.value = _basicSettingsModel.data.basicSettings.siteName;
        // userRegistration.value =
        //     _basicSettingsModel.data.basicSettings.userRegistration;
        // agreePolicy.value = _basicSettingsModel.data.basicSettings.agreePolicy;

        appBasicLogoWhite.value =
            '${imagePaths.basePath}/${imagePaths.cleanedPathLocation}/${siteLogo}';
        appBasicLogoDark.value =
            '${imagePaths.basePath}/${imagePaths.cleanedPathLocation}/${siteLogoDark}';
        appLauncher.value =
            '${imagePaths.basePath}/${imagePaths.cleanedPathLocation}/${siteLogo}';

        Strings.appName = siteName.value;
        debugPrint("Base Color -- >>  ${baseColor.value}");
        debugPrint("Base Color -- >>  ${baseColor.value}");
        CustomColor.primary = HexColor(baseColor.value);
        CustomColor.primaryDark = HexColor(baseColor.value);

        // _basicSettingsModel.data.countries.forEach(
        //   (element) {
        //     countryList.add(
        //       Country(
        //         id: element.id,
        //         name: element.name,
        //         mobileCode: element.mobileCode,
        //         currencyName: element.currencyName,
        //         currencyCode: element.currencyCode,
        //         currencySymbol: element.currencySymbol,
        //       ),
        //     );
        //   },
        // );
      },
    );
  }
}

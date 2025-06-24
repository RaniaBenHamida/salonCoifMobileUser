class BasicSettingsModel {
  final Data data;

  BasicSettingsModel({
    required this.data,
  });

  factory BasicSettingsModel.fromJson(Map<String, dynamic> json) => BasicSettingsModel(
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  final BasicSettings basicSettings;
  final BaseCur baseCur;
  final WebLinks webLinks;
  final SplashScreen splashScreen;
  final List<OnboardScreen> onboardScreens;
  final ImagePaths imagePaths;
  final AppImagePaths appImagePaths;

  Data({
    required this.basicSettings,
    required this.baseCur,
    required this.webLinks,
    required this.splashScreen,
    required this.onboardScreens,
    required this.imagePaths,
    required this.appImagePaths,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    basicSettings: BasicSettings.fromJson(json["basic_settings"]),
    baseCur: BaseCur.fromJson(json["base_cur"]),
    webLinks: WebLinks.fromJson(json["web_links"]),
    splashScreen: SplashScreen.fromJson(json["splash_screen"]),
    onboardScreens: List<OnboardScreen>.from(json["onboard_screens"].map((x) => OnboardScreen.fromJson(x))),
    imagePaths: ImagePaths.fromJson(json["image_paths"]),
    appImagePaths: AppImagePaths.fromJson(json["app_image_paths"]),
  );
}

class AppImagePaths {
  final String baseUrl;
  final String pathLocation;
  final String defaultImage;

  AppImagePaths({
    required this.baseUrl,
    required this.pathLocation,
    required this.defaultImage,
  });

  factory AppImagePaths.fromJson(Map<String, dynamic> json) => AppImagePaths(
    baseUrl: json["base_url"],
    pathLocation: json["path_location"],
    defaultImage: json["default_image"],
  );
   // Getter that returns pathLocation without "public/" if it starts with it
  String get cleanedPathLocation {
    if (pathLocation.startsWith('public/')) {
      return pathLocation.substring(7); // remove "public/"
    }
    return pathLocation;
  }
}

class BaseCur {
  final int id;
  final String code;
  final String symbol;
  final String rate;
  final bool both;
  final bool senderCurrency;
  final bool receiverCurrency;

  BaseCur({
    required this.id,
    required this.code,
    required this.symbol,
    required this.rate,
    required this.both,
    required this.senderCurrency,
    required this.receiverCurrency,
  });

  factory BaseCur.fromJson(Map<String, dynamic> json) => BaseCur(
    id: json["id"],
    code: json["code"],
    symbol: json["symbol"],
    rate: json["rate"],
    both: json["both"],
    senderCurrency: json["senderCurrency"],
    receiverCurrency: json["receiverCurrency"],
  );
}

class BasicSettings {
  final int id;
  final int userRegistration;
  final int agreePolicy;
  final String siteName;
  final String baseColor;
  final String secondaryColor;
  final String siteTitle;
  final String timezone;
  final String siteLogo;
  final String siteLogoDark;
  final String siteFav;
  final String siteFavDark;

  BasicSettings({
    required this.id,
    required this.userRegistration,
    required this.agreePolicy,
    required this.siteName,
    required this.baseColor,
    required this.secondaryColor,
    required this.siteTitle,
    required this.timezone,
    required this.siteLogo,
    required this.siteLogoDark,
    required this.siteFav,
    required this.siteFavDark,
  });

  factory BasicSettings.fromJson(Map<String, dynamic> json) => BasicSettings(
    id: json["id"],
    userRegistration: json["user_registration"] ,
    agreePolicy: json["agree_policy"],
    siteName: json["site_name"],
    baseColor: json["base_color"],
    secondaryColor: json["secondary_color"],
    siteTitle: json["site_title"],
    timezone: json["timezone"],
    siteLogo: json["site_logo"],
    siteLogoDark: json["site_logo_dark"],
    siteFav: json["site_fav"],
    siteFavDark: json["site_fav_dark"],
  );
}

class ImagePaths {
  final String basePath;
  final String pathLocation;
  final String defaultImage;

  ImagePaths({
    required this.basePath,
    required this.pathLocation,
    required this.defaultImage,
  });

  factory ImagePaths.fromJson(Map<String, dynamic> json) => ImagePaths(
    basePath: json["base_path"],
    pathLocation: json["path_location"],
    defaultImage: json["default_image"],
  );
   // Getter that returns pathLocation without "public/" if it starts with it
  String get cleanedPathLocation {
    if (pathLocation.startsWith('public/')) {
      return pathLocation.substring(7); // remove "public/"
    }
    return pathLocation;
  }
}

class OnboardScreen {
  final String title;
  final String image;
  final int status;

  OnboardScreen({
    required this.title,
    required this.image,
    required this.status,
  });

  factory OnboardScreen.fromJson(Map<String, dynamic> json) => OnboardScreen(
    title: json["title"],
    image: json["image"],
    status: json["status"],
  );
}

class SplashScreen {
  String splashScreenImage;
  final String version;

  SplashScreen({
    required this.splashScreenImage,
    required this.version,
  });

  factory SplashScreen.fromJson(Map<String, dynamic> json) => SplashScreen(
    splashScreenImage: json["splash_screen_image"] ?? "",
    version: json["version"] ?? "",
  );
}

class WebLinks {
  final String aboutUs;
  final String contactUs;
  final String privacyPolicy;

  WebLinks({
    required this.aboutUs,
    required this.contactUs,
    required this.privacyPolicy,
  });

  factory WebLinks.fromJson(Map<String, dynamic> json) => WebLinks(
    aboutUs: json["about-us"],
    contactUs: json["contact-us"],
    privacyPolicy: json["privacy-Policy"] ?? "",
  );
}

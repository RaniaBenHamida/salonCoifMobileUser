import 'package:beautyTn/base/utils/basic_import.dart';

class ProfileInfoModel {
  final Data data;

  ProfileInfoModel({
    required this.data,
  });

  factory ProfileInfoModel.fromJson(Map<String, dynamic> json) => ProfileInfoModel(
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  final UserInfo userInfo;
  final ImagePaths imagePaths;
  final List<Country> countries;

  Data({
    required this.userInfo,
    required this.imagePaths,
    required this.countries,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userInfo: UserInfo.fromJson(json["user_info"]),
    imagePaths: ImagePaths.fromJson(json["image_paths"]),
    countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
  );
}

class Country extends DropdownModel{
  final int id;
  final String name;
  final String mobileCode;
  final String currencyName;
  final String currencyCode;
  final String currencySymbol;

  Country({
    required this.id,
    required this.name,
    required this.mobileCode,
    required this.currencyName,
    required this.currencyCode,
    required this.currencySymbol,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    name: json["name"],
    mobileCode: json["mobile_code"],
    currencyName: json["currency_name"],
    currencyCode: json["currency_code"],
    currencySymbol: json["currency_symbol"],
  );

  @override
  String get title => name;
}

class ImagePaths {
  final String baseUrl;
  final String pathLocation;
  final String defaultImage;

  ImagePaths({
    required this.baseUrl,
    required this.pathLocation,
    required this.defaultImage,
  });

  factory ImagePaths.fromJson(Map<String, dynamic> json) => ImagePaths(
    baseUrl: json["base_url"],
    pathLocation: json["path_location"],
    defaultImage: json["default_image"],
  );
}

class UserInfo {
  final int id;
  final String firstname;
  final String lastname;
  final String username;
  final String email;
  final String mobileCode;
  final String mobile;
  final String image;
  final String country;
  final String city;
  final String state;
  final String postalCode;
  final String address;

  UserInfo({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.mobileCode,
    required this.mobile,
    required this.image,
    required this.country,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.address,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    username: json["username"],
    email: json["email"],
    mobileCode: json["mobile_code"] ?? "",
    mobile: json["mobile"] ?? "",
    image: json["image"] ?? "",
    country: json["country"],
    city: json["city"],
    state: json["state"],
    postalCode: json["postal_code"],
    address: json["address"],
  );
}
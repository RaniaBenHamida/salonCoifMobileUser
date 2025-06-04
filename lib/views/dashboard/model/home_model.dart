class HomeModel {
  final Data data;

  HomeModel({
    required this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  final String defaultImage;
  final String imagePath;
  final String baseUr;
  final List<BannerDatum> bannerData;
  final List<ServiceDatum> serviceData;

  Data({
    required this.defaultImage,
    required this.imagePath,
    required this.baseUr,
   
    required this.bannerData,
    required this.serviceData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        defaultImage: json["default_image"],
        imagePath: json["image_path"],
        baseUr: json["base_ur"],
        bannerData: List<BannerDatum>.from(
            json["bannerData"].map((x) => BannerDatum.fromJson(x))),
        
        serviceData: List<ServiceDatum>.from(
            json["serviceData"].map((x) => ServiceDatum.fromJson(x))),
      );
}

class BannerDatum {
  final String image;
  final String heading;
  final String subHeading;
  final String leftButton;
  final String rightButton;

  BannerDatum({
    required this.image,
    required this.heading,
    required this.subHeading,
    required this.leftButton,
    required this.rightButton,
  });

  factory BannerDatum.fromJson(Map<String, dynamic> json) => BannerDatum(
        image: json["image"],
        heading: json["heading"],
        subHeading: json["sub_heading"],
        leftButton: json["left_button"],
        rightButton: json["right_button"],
      );
}

class ServiceDatum {
  final String title;
  final String subHeading;
  final String heading;
  final String description;
  final String image;

  ServiceDatum({
    required this.title,
    required this.subHeading,
    required this.heading,
    required this.description,
    required this.image,
  });

  factory ServiceDatum.fromJson(Map<String, dynamic> json) => ServiceDatum(
        title: json["title"],
        subHeading: json["sub_heading"] ?? "",
        heading: json["heading"] ?? "",
        description: json["description"] ?? "",
        image: json["image"] ?? "",
      );
}

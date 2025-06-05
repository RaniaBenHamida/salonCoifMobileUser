import '../../../base/widgets/custom_drop_down.dart';

class ParlourListInfo {
  final Data data;

  ParlourListInfo({
    required this.data,
  });

  factory ParlourListInfo.fromJson(Map<String, dynamic> json) => ParlourListInfo(
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  final List<Area> area;
  final List<ParlourList> parlourList;
  final ParlourImagePath parlourImagePath;

  Data({
    required this.area,
    required this.parlourList,
    required this.parlourImagePath,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    area: List<Area>.from(json["area"].map((x) => Area.fromJson(x))),
    parlourList: List<ParlourList>.from(json["parlour_list"].map((x) => ParlourList.fromJson(x))),
    parlourImagePath: ParlourImagePath.fromJson(json["parlour_image_path"]),
  );
}

class Area extends DropdownModel{
  final int id;
  final String slug;
  final String name;
  final int status;

  Area({
    required this.id,
    required this.slug,
    required this.name,
    required this.status,
  });

  factory Area.fromJson(Map<String, dynamic> json) => Area(
    id: json["id"],
    slug: json["slug"],
    name: json["name"],
    status: json["status"],
  );

  @override
  String get title => name;
}

class ParlourImagePath {
  final String baseUrl;
  final String pathLocation;
  final String defaultImage;

  ParlourImagePath({
    required this.baseUrl,
    required this.pathLocation,
    required this.defaultImage,
  });

  factory ParlourImagePath.fromJson(Map<String, dynamic> json) => ParlourImagePath(
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

class ParlourList {
  final int id;
  final int areaId;
  final String? vendorId;
  final String slug;
  final String name;
  final String managerName;
  final String experience;
  final String speciality;
  final String contact;
  final String address;
  final String offDays;
  final int numberOfDates;
  final String image;
  final int status;
  final DateTime createdAt;

  ParlourList({
    required this.id,
    required this.areaId,
    required this.vendorId,
    required this.slug,
    required this.name,
    required this.managerName,
    required this.experience,
    required this.speciality,
    required this.contact,
    required this.address,
    required this.offDays,
    required this.numberOfDates,
    required this.image,
    required this.status,
    required this.createdAt,
  });

  factory ParlourList.fromJson(Map<String, dynamic> json) => ParlourList(
    id: json["id"],
    areaId: json["area_id"],
    vendorId: (json["vendor_id"] ?? "").toString(),
    slug: json["slug"],
    name: json["name"],
    managerName: json["manager_name"] ?? "",
    experience: json["experience"],
    speciality: json["speciality"],
    contact: json["contact"],
    address: json["address"],
    offDays: json["off_days"],
    numberOfDates: json["number_of_dates"],
    image: json["image"] ?? "",
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
  );
}
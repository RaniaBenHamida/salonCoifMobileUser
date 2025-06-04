import 'parlour_info_model.dart';

class ParlourSearchModel {
  final List<ParlourList> data;

  ParlourSearchModel({
    required this.data,
  });

  factory ParlourSearchModel.fromJson(Map<String, dynamic> json) => ParlourSearchModel(
    data: List<ParlourList>.from(json["data"].map((x) => ParlourList.fromJson(x))),
  );
}

// class Datum {
//   final int id;
//   final int areaId;
//   final dynamic vendorId;
//   final dynamic managerId;
//   final String slug;
//   final String name;
//   final String experience;
//   final String speciality;
//   final String contact;
//   final String address;
//   final String offDays;
//   final int numberOfDates;
//   final String image;
//   final dynamic remarks;
//   final int status;
//   final int activeStatus;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//
//   Datum({
//     required this.id,
//     required this.areaId,
//     required this.vendorId,
//     required this.managerId,
//     required this.slug,
//     required this.name,
//     required this.experience,
//     required this.speciality,
//     required this.contact,
//     required this.address,
//     required this.offDays,
//     required this.numberOfDates,
//     required this.image,
//     required this.remarks,
//     required this.status,
//     required this.activeStatus,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     id: json["id"],
//     areaId: json["area_id"],
//     vendorId: json["vendor_id"],
//     managerId: json["manager_id"],
//     slug: json["slug"],
//     name: json["name"],
//     experience: json["experience"],
//     speciality: json["speciality"],
//     contact: json["contact"],
//     address: json["address"],
//     offDays: json["off_days"],
//     numberOfDates: json["number_of_dates"],
//     image: json["image"],
//     remarks: json["remarks"],
//     status: json["status"],
//     activeStatus: json["active_status"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
// }
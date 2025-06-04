// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  Message message;
  Data data;

  NotificationModel({
    required this.message,
    required this.data,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  ImagePath imagePath;
  List<NotificationDatum> notificationData;

  Data({
    required this.imagePath,
    required this.notificationData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        imagePath: ImagePath.fromJson(json["image_path"]),
        notificationData: List<NotificationDatum>.from(json["notification_data"]
            .map((x) => NotificationDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "image_path": imagePath.toJson(),
        "notification_data":
            List<dynamic>.from(notificationData.map((x) => x.toJson())),
      };
}

class ImagePath {
  String baseUrl;
  String pathLocation;
  String defaultImage;

  ImagePath({
    required this.baseUrl,
    required this.pathLocation,
    required this.defaultImage,
  });

  factory ImagePath.fromJson(Map<String, dynamic> json) => ImagePath(
        baseUrl: json["base_url"],
        pathLocation: json["path_location"],
        defaultImage: json["default_image"],
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "path_location": pathLocation,
        "default_image": defaultImage,
      };
}

class NotificationDatum {
  int id;
  int parlourId;
  int scheduleId;
  int userId;
  int serialNumber;
  String date;
  String paymentMethod;
  String totalCharge;
  String price;
  String payablePrice;
  String? gatewayPayablePrice;
  List<String> service;
  DateTime createdAt;
  DateTime? updatedAt;
  Parlour parlour;

  NotificationDatum({
    required this.id,
    required this.parlourId,
    required this.scheduleId,
    required this.userId,
    required this.serialNumber,
    required this.date,
    required this.paymentMethod,
    required this.totalCharge,
    required this.price,
    required this.payablePrice,
    required this.gatewayPayablePrice,
    required this.service,
    required this.createdAt,
    required this.updatedAt,
    required this.parlour,
  });

  factory NotificationDatum.fromJson(Map<String, dynamic> json) =>
      NotificationDatum(
        id: json["id"],
        parlourId: json["parlour_id"],
        scheduleId: json["schedule_id"],
        userId: json["user_id"],
        serialNumber: json["serial_number"],
        date: json["date"],
        paymentMethod: json["payment_method"],
        totalCharge: json["total_charge"],
        price: json["price"],
        payablePrice: json["payable_price"],
        gatewayPayablePrice: json["gateway_payable_price"] ?? "",
        service: List<String>.from(json["service"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
        parlour: Parlour.fromJson(json["parlour"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parlour_id": parlourId,
        "schedule_id": scheduleId,
        "user_id": userId,
        "serial_number": serialNumber,
        "date": date,
        "payment_method": paymentMethod,
        "total_charge": totalCharge,
        "price": price,
        "payable_price": payablePrice,
        "gateway_payable_price": gatewayPayablePrice,
        "service": List<dynamic>.from(service.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "parlour": parlour.toJson(),
      };
}

class Parlour {
  int id;
  String slug;
  String name;
  int numberOfDates;
  String image;

  Parlour({
    required this.id,
    required this.slug,
    required this.name,
    required this.numberOfDates,
    required this.image,
  });

  factory Parlour.fromJson(Map<String, dynamic> json) => Parlour(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        numberOfDates: json["number_of_dates"],
        image: json["image"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "number_of_dates": numberOfDates,
        "image": image,
      };
}

class Message {
  List<String> success;

  Message({
    required this.success,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        success: List<String>.from(json["success"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": List<dynamic>.from(success.map((x) => x)),
      };
}

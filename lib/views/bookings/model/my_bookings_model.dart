class MyBookingsModel {
  final Data data;

  MyBookingsModel({
    required this.data,
  });

  factory MyBookingsModel.fromJson(Map<String, dynamic> json) => MyBookingsModel(
    data: Data.fromJson(json["data"]),
  );
}


class Data {
  final ImagePath imagePath;
  final List<Datum> data;
  final String curCode;

  Data({
    required this.imagePath,
    required this.data,
    required this.curCode,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    imagePath: ImagePath.fromJson(json["image_path"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    curCode: json["cur_code"],
  );
}

class ImagePath {
  final String baseUrl;
  final String pathLocation;
  final String defaultImage;

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
     String get cleanedPathLocation {
    if (pathLocation.startsWith('public/')) {
      return pathLocation.substring(7); // remove "public/"
    }
    return pathLocation;
  }
}

class Datum {
  final int id;
  final int parlourId;
  final int scheduleId;
  final int userId;
  final dynamic vendorId;
  final dynamic stuffId;
  final int paymentGatewayCurrencyId;
  final String trxId;
  final int bookingExpSeconds;
  final int serialNumber;
  final String date;
  final String paymentMethod;
  final String slug;
  final String totalCharge;
  final String price;
  final String payablePrice;
  final String gatewayPayablePrice;
  final List<String> service;
  final dynamic message;
  final String type;
  final String paymentCurrency;
  final String remark;
  final String details;
  final int status;
  final dynamic rejectReason;
  final dynamic callbackRef;
  final DateTime createdAt;
  final Parlour parlour;
  final Schedule schedule;

  Datum({
    required this.id,
    required this.parlourId,
    required this.scheduleId,
    required this.userId,
    required this.vendorId,
    required this.stuffId,
    required this.paymentGatewayCurrencyId,
    required this.trxId,
    required this.bookingExpSeconds,
    required this.serialNumber,
    required this.date,
    required this.paymentMethod,
    required this.slug,
    required this.totalCharge,
    required this.price,
    required this.payablePrice,
    required this.gatewayPayablePrice,
    required this.service,
    required this.message,
    required this.type,
    required this.paymentCurrency,
    required this.remark,
    required this.details,
    required this.status,
    required this.rejectReason,
    required this.callbackRef,
    required this.createdAt,
    required this.parlour,
    required this.schedule,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    parlourId: json["parlour_id"],
    scheduleId: json["schedule_id"],
    userId: json["user_id"],
    vendorId: json["vendor_id"],
    stuffId: json["stuff_id"],
    paymentGatewayCurrencyId: json["payment_gateway_currency_id"] ?? 0,
    trxId: json["trx_id"],
    bookingExpSeconds: json["booking_exp_seconds"],
    serialNumber: json["serial_number"],
    date: json["date"],
    paymentMethod: json["payment_method"],
    slug: json["slug"],
    totalCharge: json["total_charge"],
    price: json["price"],
    payablePrice: json["payable_price"],
    gatewayPayablePrice: json["gateway_payable_price"] ?? "",
    service: List<String>.from(json["service"].map((x) => x)),
    message: json["message"],
    type: json["type"],
    paymentCurrency: json["payment_currency"] ?? "",
    remark: json["remark"],
    details: json["details"] ?? "",
    status: json["status"],
    rejectReason: json["reject_reason"],
    callbackRef: json["callback_ref"],
    createdAt: DateTime.parse(json["created_at"]),
    parlour: Parlour.fromJson(json["parlour"]),
    schedule: Schedule.fromJson(json["schedule"]),
  );
}

class Parlour {
  final int id;
  final int areaId;
  final dynamic vendorId;
  final dynamic managerId;
  final String slug;
  final String name;
  final String experience;
  final String speciality;
  final String contact;
  final String address;
  final String offDays;
  final int numberOfDates;
  final String image;
  final dynamic remarks;
  final int status;
  final int activeStatus;
  final DateTime createdAt;
  final DateTime updatedAt;

  Parlour({
    required this.id,
    required this.areaId,
    required this.vendorId,
    required this.managerId,
    required this.slug,
    required this.name,
    required this.experience,
    required this.speciality,
    required this.contact,
    required this.address,
    required this.offDays,
    required this.numberOfDates,
    required this.image,
    required this.remarks,
    required this.status,
    required this.activeStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Parlour.fromJson(Map<String, dynamic> json) => Parlour(
    id: json["id"],
    areaId: json["area_id"],
    vendorId: json["vendor_id"],
    managerId: json["manager_id"],
    slug: json["slug"],
    name: json["name"],
    experience: json["experience"],
    speciality: json["speciality"],
    contact: json["contact"],
    address: json["address"],
    offDays: json["off_days"],
    numberOfDates: json["number_of_dates"],
    image: json["image"] ?? "",
    remarks: json["remarks"],
    status: json["status"],
    activeStatus: json["active_status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}

class Schedule {
  final int id;
  final int parlourListId;
  final String fromTime;
  final String toTime;
  final int maxClient;
  final int status;
  final DateTime createdAt;

  Schedule({
    required this.id,
    required this.parlourListId,
    required this.fromTime,
    required this.toTime,
    required this.maxClient,
    required this.status,
    required this.createdAt,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    id: json["id"],
    parlourListId: json["parlour_list_id"],
    fromTime: json["from_time"],
    toTime: json["to_time"],
    maxClient: json["max_client"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
  );
}
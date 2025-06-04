
class TwoFaModel {
  final Data data;

  TwoFaModel({
    required this.data,
  });

  factory TwoFaModel.fromJson(Map<String, dynamic> json) => TwoFaModel(
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  final String qrSecret;
  final String qrCode;
  final int status;
  final String message;

  Data({
    required this.qrSecret,
    required this.qrCode,
    required this.status,
    required this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    qrSecret: json["qr_secret"],
    qrCode: json["qr_code"],
    status: json["status"],
    message: json["message"],
  );
}

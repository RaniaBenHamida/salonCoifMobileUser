class CheckoutModel {
  final Message message;
  final Data data;

  CheckoutModel({
    required this.message,
    required this.data,
  });

  factory CheckoutModel.fromJson(Map<String, dynamic> json) => CheckoutModel(
    message: Message.fromJson(json["message"]),
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  final String slug;
  final double price;
  final double payablePrice;
  final int serialNumber;

  Data({
    required this.slug,
    required this.price,
    required this.payablePrice,
    required this.serialNumber,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    slug: json["slug"],
    price: json["price"].toDouble(),
    payablePrice: json["payable_price"].toDouble(),
    serialNumber: json["serial_number"],
  );
}

class Message {
  final List<String> success;

  Message({
    required this.success,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    success: List<String>.from(json["success"].map((x) => x)),
  );
}
class PaymentMethodModel {
  final Data data;

  PaymentMethodModel({
    required this.data,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) => PaymentMethodModel(
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  final List<PaymentGateway> paymentGateways;

  Data({
    required this.paymentGateways,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    paymentGateways: List<PaymentGateway>.from(json["payment_gateways"].map((x) => PaymentGateway.fromJson(x))),
  );
}

class PaymentGateway {
  final int id;
  final String type;
  final String name;
  final bool crypto;
  final String desc;
  final int status;
  final List<Currency> currencies;

  PaymentGateway({
    required this.id,
    required this.type,
    required this.name,
    required this.crypto,
    required this.desc,
    required this.status,
    required this.currencies,
  });

  factory PaymentGateway.fromJson(Map<String, dynamic> json) => PaymentGateway(
    id: json["id"],
    type: json["type"],
    name: json["name"],
    crypto: json["crypto"],
    desc: json["desc"] ?? "",
    status: json["status"],
    currencies: List<Currency>.from(json["currencies"].map((x) => Currency.fromJson(x))),
  );
}

class Currency {
  final int id;
  final int paymentGatewayId;
  final String name;
  final String alias;
  final String currencyCode;
  final String currencySymbol;
  final String image;
  final String minLimit;
  final String maxLimit;
  final String percentCharge;
  final String fixedCharge;
  final String rate;
  // final DateTime createdAt;
  // final DateTime updatedAt;

  Currency({
    required this.id,
    required this.paymentGatewayId,
    required this.name,
    required this.alias,
    required this.currencyCode,
    required this.currencySymbol,
    required this.image,
    required this.minLimit,
    required this.maxLimit,
    required this.percentCharge,
    required this.fixedCharge,
    required this.rate,
    // required this.createdAt,
    // required this.updatedAt,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    id: json["id"],
    paymentGatewayId: json["payment_gateway_id"],
    name: json["name"],
    alias: json["alias"],
    currencyCode: json["currency_code"],
    currencySymbol: json["currency_symbol"] ?? "",
    image: json["image"] ?? "",
    minLimit: json["min_limit"],
    maxLimit: json["max_limit"],
    percentCharge: json["percent_charge"],
    fixedCharge: json["fixed_charge"],
    rate: json["rate"],
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
  );
}

class AutomaticPaymentModel {
  final Data data;

  AutomaticPaymentModel({
    required this.data,
  });

  factory AutomaticPaymentModel.fromJson(Map<String, dynamic> json) => AutomaticPaymentModel(
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  final String redirectUrl;

  Data({
    required this.redirectUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    redirectUrl: json["redirect_url"],
  );
}
class ServiceAndScheduleModel {
  final Data data;

  ServiceAndScheduleModel({
    required this.data,
  });

  factory ServiceAndScheduleModel.fromJson(Map<String, dynamic> json) => ServiceAndScheduleModel(
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  final List<ParlourHasService> parlourHasService;
  final List<ParlourHasSchedule> parlourHasSchedule;

  Data({
    required this.parlourHasService,
    required this.parlourHasSchedule,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    parlourHasService: List<ParlourHasService>.from(json["parlour_has_service"].map((x) => ParlourHasService.fromJson(x))),
    parlourHasSchedule: List<ParlourHasSchedule>.from(json["parlour_has_schedule"].map((x) => ParlourHasSchedule.fromJson(x))),
  );
}

class ParlourHasSchedule {
  final int id;
  final int parlourListId;
  final String fromTime;
  final String toTime;
  final int maxClient;
  final int status;

  ParlourHasSchedule({
    required this.id,
    required this.parlourListId,
    required this.fromTime,
    required this.toTime,
    required this.maxClient,
    required this.status,
  });

  factory ParlourHasSchedule.fromJson(Map<String, dynamic> json) => ParlourHasSchedule(
    id: json["id"],
    parlourListId: json["parlour_list_id"],
    fromTime: json["from_time"],
    toTime: json["to_time"],
    maxClient: json["max_client"],
    status: json["status"],
  );
}

class ParlourHasService {
  final int id;
  final int parlourListId;
  final String serviceName;
  final String price;

  ParlourHasService({
    required this.id,
    required this.parlourListId,
    required this.serviceName,
    required this.price,
  });

  factory ParlourHasService.fromJson(Map<String, dynamic> json) => ParlourHasService(
    id: json["id"],
    parlourListId: json["parlour_list_id"],
    serviceName: json["service_name"],
    price: json["price"],
  );
}
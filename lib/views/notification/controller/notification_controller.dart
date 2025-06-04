import 'package:get/get.dart';
import 'package:beautyTn/base/api/method/request_process.dart';

import '../../../base/api/endpoint/api_endpoint.dart';
import '../model/notification_model.dart';

class NotificationController extends GetxController {
  final imagePath =
      "".obs;
  List<NotificationDatum> notifications = [];

  @override
  void onInit() {
    notificationInfoApi();
    super.onInit();
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late NotificationModel _notificationModel;
  NotificationModel get notificationModel => _notificationModel;

  Future<NotificationModel?> notificationInfoApi() async {
    return RequestProcess().request(
        fromJson: NotificationModel.fromJson,
        apiEndpoint: ApiEndpoint.notification,
        isLoading: _isLoading,
        onSuccess: (value) {
          _notificationModel = value!;


          _setData();
        });
  }

  _setData() {
    notifications.clear();
    _notificationModel.data.notificationData.forEach((n) {
      notifications.add(NotificationDatum(
          id: n.id,
          parlourId: n.parlourId,
          scheduleId: n.scheduleId,
          userId: n.userId,
          serialNumber: n.serialNumber,
          date: n.date,
          paymentMethod: n.paymentMethod,
          totalCharge: n.totalCharge,
          price: n.price,
          payablePrice: n.payablePrice,
          gatewayPayablePrice: n.gatewayPayablePrice,
          service: n.service,
          createdAt: n.createdAt,
          updatedAt: n.updatedAt,
          parlour: n.parlour));
    });
    imagePath.value = _notificationModel.data.imagePath.baseUrl + "/" + _notificationModel.data.imagePath.pathLocation;
  }
}

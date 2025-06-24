import 'package:get/get.dart';

import '../../../base/api/endpoint/api_endpoint.dart';
import '../../../base/api/method/request_process.dart';
import '../model/my_bookings_model.dart';

class BookingsController extends GetxController {
  @override
  void onInit() {
    myBookingsApi();
    super.onInit();
  }

  List<Datum> bookingsList = [];
  final imagePath = "".obs;
  final pathLocation = "".obs;

  /// ------------------------------
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late MyBookingsModel _myBookingsModel;
  MyBookingsModel get myBookingsModel => _myBookingsModel;

  Future<MyBookingsModel?> myBookingsApi() async {
    return RequestProcess().request<MyBookingsModel>(
      fromJson: MyBookingsModel.fromJson,
      apiEndpoint: ApiEndpoint.myBookings,
      isBasic: false,
      isLoading: _isLoading,
      showErrorMessage: true,
      showResult: true,
      onSuccess: (value) {
        _myBookingsModel = value!;
        _setData();
      },
    );
  }

  _setData() {
    _myBookingsModel.data.data.forEach((bk) {
      bookingsList.add(Datum(
          id: bk.id,
          parlourId: bk.parlourId,
          scheduleId: bk.scheduleId,
          userId: bk.userId,
          vendorId: bk.vendorId,
          stuffId: bk.stuffId,
          paymentGatewayCurrencyId: bk.paymentGatewayCurrencyId,
          trxId: bk.trxId,
          bookingExpSeconds: bk.bookingExpSeconds,
          serialNumber: bk.serialNumber,
          date: bk.date,
          paymentMethod: bk.paymentMethod,
          slug: bk.slug,
          totalCharge: bk.totalCharge,
          price: bk.price,
          payablePrice: bk.payablePrice,
          gatewayPayablePrice: bk.gatewayPayablePrice,
          service: bk.service,
          message: bk.message,
          type: bk.type,
          paymentCurrency: bk.paymentCurrency,
          remark: bk.remark,
          details: bk.details,
          status: bk.status,
          rejectReason: bk.rejectReason,
          callbackRef: bk.callbackRef,
          createdAt: bk.createdAt,
          parlour: bk.parlour,
          schedule: bk.schedule));
    });
    imagePath.value = "${_myBookingsModel.data.imagePath.baseUrl}";
    pathLocation.value = "${_myBookingsModel.data.imagePath.cleanedPathLocation}";
  }
}

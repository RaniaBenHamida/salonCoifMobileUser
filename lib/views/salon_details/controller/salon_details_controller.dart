import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../base/api/endpoint/api_endpoint.dart';
import '../../../base/api/method/request_process.dart';
import '../../../languages/strings.dart';
import '../../../routes/routes.dart';
import '../../dashboard/model/parlour_info_model.dart';
import '../model/checkout_model.dart';
import '../model/service_and_schedule_model.dart';

class SalonDetailsController extends GetxController {
  final ParlourList salonInfo = Get.arguments.first;
  RxBool showSchedule = false.obs;
  RxBool showTimes = false.obs;

  // To track selected services
  RxDouble totalPrice = 0.0.obs;
  List serviceList = [];
  RxList<int> selectedServicesIndexes = <int>[].obs;

  // To track dates
  RxString selectedDate = Strings.selectDate.obs;
  late List dates = [];

  // To track services times
  RxInt selectedTimesIndexes = (-1).obs;
  RxString selectedTimeId = "".obs;
  String selectedTime = "";

  // To message field controller
  final messageController = TextEditingController();

  _setDatesMethod() {
    dates = generateDates(
        offDays: salonInfo.offDays, numberOfDates: salonInfo.numberOfDates);
    print(dates);
  }

  List<String> generateDates({
    required String offDays,
    required int numberOfDates,
  }) {
    final Set<String> offDaySet =
        offDays.split(',').map((e) => e.trim().toLowerCase()).toSet();

    final DateFormat formatter = DateFormat('dd MMM yyyy');

    List<String> dates = [];
    DateTime currentDate = DateTime.now().toLocal();
    print(currentDate);

    int i = 0;
    while (i < numberOfDates) {
      i++;
      String currentDayName =
          DateFormat('EEEE').format(currentDate).toLowerCase();
      if (!offDaySet.contains(currentDayName)) {
        dates.add(formatter.format(currentDate));
      }
      currentDate = currentDate.add(const Duration(days: 1));
    }

    return dates;
  }

  @override
  void onInit() {
    _setDatesMethod();
    serviceAndScheduleProcess();
    super.onInit();
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late ServiceAndScheduleModel _serviceAndScheduleModel;
  ServiceAndScheduleModel get serviceAndScheduleModel =>
      _serviceAndScheduleModel;

  Future<ServiceAndScheduleModel?> serviceAndScheduleProcess() async {
    return RequestProcess().request<ServiceAndScheduleModel>(
      fromJson: ServiceAndScheduleModel.fromJson,
      // apiEndpoint: ApiEndpoint(),
      apiEndpoint: ApiEndpoint.scheduleServiceInfo,
      extraPath: "/${salonInfo.id.toString()}",
      isLoading: _isLoading,
      isBasic: false,
      onSuccess: (value) {
        _serviceAndScheduleModel = value!;
        _setData();
      },
    );
  }

  List<ParlourHasSchedule> scheduleList = [];
  RxList<ParlourHasSchedule> filteredScheduleList = <ParlourHasSchedule>[].obs;

  _setData() {
    _serviceAndScheduleModel.data.parlourHasSchedule.forEach((sc) {
      scheduleList.add(sc);
    });
  }

  List<ParlourHasSchedule> filterTimeSlots(
      List<ParlourHasSchedule> scheduleList, RxString selectedDate) {
    // Convert the RxString to DateTime
    DateTime selectedDateTime =
        DateFormat('dd MMM yyyy').parse(selectedDate.value);
    DateTime now = DateTime.now();
    bool isToday = DateFormat('dd MMM yyyy').format(selectedDateTime) ==
        DateFormat('dd MMM yyyy').format(now);

    return scheduleList.where((slot) {
      DateTime fromTime = DateFormat('HH:mm').parse(slot.fromTime);
      DateTime slotDateTime = DateTime(
          selectedDateTime.year,
          selectedDateTime.month,
          selectedDateTime.day,
          fromTime.hour,
          fromTime.minute);

      // If today, show only future time slots; otherwise, show all slots
      return !isToday || slotDateTime.isAfter(now);
    }).toList();
  }

  setTime() {
    filteredScheduleList.value = filterTimeSlots(scheduleList, selectedDate);
    update();
  }

  /// -----------

  final _isCheckoutLoading = false.obs;
  bool get isCheckoutLoading => _isCheckoutLoading.value;

  late CheckoutModel _checkoutModel;
  CheckoutModel get checkoutModel => _checkoutModel;

  Future<CheckoutModel?> checkoutPostApi() async {
    Map<String, dynamic> inputBody = {
      'parlour': salonInfo.slug,
      'price': totalPrice.value,
      // 'service[]': serviceList.join(", "),
      'service': serviceList,
      'date': selectedDate.value,
      'schedule': selectedTimeId.value,
      'message': messageController.text,
      'vendor_id': salonInfo.vendorId,
    };

    return RequestProcess().request<CheckoutModel>(
      fromJson: CheckoutModel.fromJson,
      apiEndpoint: ApiEndpoint.checkoutInfo,
      isLoading: _isCheckoutLoading,
      isBasic: false,
      method: HttpMethod.POST,
      body: inputBody,
      onSuccess: (value) {
        _checkoutModel = value!;
        Get.toNamed(Routes.appointmentPreviewScreen);
      },
    );
  }
}

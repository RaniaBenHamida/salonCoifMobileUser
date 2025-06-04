import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beautyTn/base/utils/basic_import.dart';

import '../../../base/api/endpoint/api_endpoint.dart';
import '../../../base/api/method/request_process.dart';
import '../../../base/api/model/common_success_model.dart';
import '../../../routes/routes.dart';
import '../../confirm_screen.dart';
import '../../flutter_web_screen.dart';
import '../../salon_details/controller/salon_details_controller.dart';
import '../model/automatic_payment_model.dart';
import '../model/payment_gateway_model.dart';

class AppointmentPreviewController extends GetxController {
  final previewController = Get.find<SalonDetailsController>();

  final List<Currency> paymentMethods = [
    Currency(
        id: 0,
        paymentGatewayId: 0,
        name: "Cash Payment",
        alias: "",
        currencyCode: "",
        currencySymbol: "",
        image: "",
        minLimit: "",
        maxLimit: "",
        percentCharge: "",
        fixedCharge: "",
        rate: ""
    )
  ];

  late Currency selectedPaymentMethod;
  RxString selectedMethodName = "".obs;

  @override
  void onInit() {
    paymentGatewayInfoApi();
    super.onInit();
  }

  /// ---------------------------------
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late PaymentMethodModel _paymentMethodModel;
  PaymentMethodModel get paymentMethodModel => _paymentMethodModel;

  Future<PaymentMethodModel?> paymentGatewayInfoApi() async {
    return RequestProcess().request<PaymentMethodModel>(
      fromJson: PaymentMethodModel.fromJson,
      apiEndpoint: ApiEndpoint.paymentMethodInfo,
      isLoading: _isLoading,
      isBasic: false,
      showResult: true,
      onSuccess: (value) {
        _paymentMethodModel = value!;
        _paymentMethodModel.data.paymentGateways.forEach((value) {
          paymentMethods.addAll(value.currencies);
        });
      },
    );
  }

/// ---------------------------------
  final _isConfirmLoading = false.obs;
  bool get isConfirmLoading => _isConfirmLoading.value;


  late CommonSuccessModel _commonSuccessModel;
  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  Future<CommonSuccessModel?> processCashPayment() async {

    Map<String, dynamic> inputBody = {
      'payment_method': selectedMethodName.value,
      'amount': previewController.checkoutModel.data.payablePrice.toStringAsFixed(2),
    };

    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.cashPaymentUrl,
      extraPath: "/${previewController.checkoutModel.data.slug}",
      isLoading: _isConfirmLoading,
      method: HttpMethod.POST,
      body: inputBody,
      onSuccess: (value) {
        _commonSuccessModel = value!;

        Get.to(ConfirmScreen(
          msg: Strings.confirmAppointmentSubTitle,
          path: "assets/icons/success.svg",
          onTap: () {
            Get.offAllNamed(Routes.navigation);
          },
        ));

      },
    );
  }

  late AutomaticPaymentModel _automaticPaymentModel;
  AutomaticPaymentModel get automaticPaymentModel => _automaticPaymentModel;

  Future<AutomaticPaymentModel?> processAutomaticPayment() async {

    Map<String, dynamic> inputBody = {
      'currency': selectedPaymentMethod.alias,
      'amount': previewController.checkoutModel.data.payablePrice.toStringAsFixed(2),
    };

    return RequestProcess().request<AutomaticPaymentModel>(
      fromJson: AutomaticPaymentModel.fromJson,
      apiEndpoint: ApiEndpoint.automaticPaymentUrl,
      extraPath: "/${previewController.checkoutModel.data.slug}",
      isLoading: _isConfirmLoading,
      method: HttpMethod.POST,
      body: inputBody,
      onSuccess: (value) {
        _automaticPaymentModel = value!;

        debugPrint("GO WEBVIEW PAYMENT URL");
        debugPrint(_automaticPaymentModel.data.redirectUrl);
        Navigator.push(
            Get.context!,
            MaterialPageRoute(
                builder: (context) => FlutterWebScreen(
                  url: _automaticPaymentModel.data.redirectUrl,
                  onHomeClick: (){
                    Get.offAllNamed(Routes.navigation);
                  },
                  onFinished: (url) {
                    debugPrint("---------------------------------");
                    debugPrint("URL    --------------------------");
                    if(url.toString().toLowerCase().contains("cancel")){
                      CustomSnackBar.error(Strings.cancelMessage);
                      Get.offAllNamed(Routes.navigation);
                    }else{
                      debugPrint(url.toString());
                      if (url.toString().contains('success/response') ||
                          url.toString().contains('sslcommerz/success') ||
                          url.toString().contains('flutterwave/callback') ||
                          url.toString().contains('razor/callback') ||
                          url.toString().contains('qrpay/callback') ||
                          url.toString().contains('paystack/pay/callback?output') ||
                          url.toString().contains('/payment/confirmed/') ||
                          url.toString().contains('/payment/success/')) {

                        debugPrint("CONDITION TRUE");
                        debugPrint("SUCCESS");

                        Get.to(ConfirmScreen(
                          msg: Strings.confirmAppointmentSubTitle,
                          path: "assets/icons/success.svg",
                          onTap: () {
                            Get.offAllNamed(Routes.navigation);
                          },
                        ));

                      }
                    }

                  },
                )));

      },
    );
  }


}

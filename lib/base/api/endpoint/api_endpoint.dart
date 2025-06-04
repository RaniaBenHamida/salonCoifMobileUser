import 'package:dynamic_languages/dynamic_languages.dart';

class ApiConfig {
static const String mainDomain = "http://127.0.0.1:8000";

  static const String baseUrl = "$mainDomain/api/v1";
  static const String languageUrl = "$baseUrl/settings/languages";
}

enum ApiEndpoint {
  // Settings
  basicSettings('/settings/basic-settings'),

  // Auth
  login('/login'),
  forgotPassword('/password/forgot/find/user'),
  forgotPasswordVerifyCode('/password/forgot/verify/code'),
  resendForgotOtpCode('/password/forgot/resend/code'),
  resetPassword('/password/forgot/reset'),

  register('/register'),
  emailOtpVerify('/authorize/mail/verify/code'),
  resendEmailOtp('/authorize/mail/resend/code'),

  // 2FA
  twoFaInfo('/authorize/google/2fa/status'),
  twoFaStatusUpdate('/authorize/google/2fa/status/update'),
  twoFaOtpVerify('/authorize/google/2fa/verify'),

  logOut('/user/logout'),

  // Parlour
  parlourInfo('/settings/parlour-list'),
  bannerUrl('/frontend'),
  searchParlourInfo('/settings/search-parlour'),
  scheduleServiceInfo('/settings/schedule-service'),
  checkoutInfo('/user/payment-method/checkout'),
  paymentMethodInfo('/user/payment-method/payment-gateways'),

  cashPaymentUrl('/user/payment-method/cashPayment/submit'),
  automaticPaymentUrl('/user/payment-method/automatic/submit'),

  // Bookings
  myBookings('/user/transaction/history'),
  myBookingDetails('/user/transaction/booking/details'),

  // Notification
  notification('/user/notifications'),

  // dashboard
  dashboard('/user/dashboard'),

  // Profile
  profileInfo('/user/profile/info'),
  updateProfile('/user/profile/info/update'),
  updatePassword('/user/profile/password/update'),
  deleteAccount('/user/profile/delete'),

  // Transaction Log
  transactionLog('/user/transaction/log');

  final String path;
  const ApiEndpoint(this.path);

  /// Returns the full URL with optional query parameters
  String url({Map<String, String>? params}) {
    var fullUrl = "${ApiConfig.baseUrl}$path";
    if (params != null && params.isNotEmpty) {
      fullUrl +=
          '?${params.entries.map((e) => '${e.key}=${e.value}').join('&')}&?lang=${DynamicLanguage.selectedLanguage.value}';
    } else {
      fullUrl += '?lang=${DynamicLanguage.selectedLanguage.value}';
    }
    return fullUrl;
  }

  /// Returns the full URL with optional query parameters
  String addUrl({required String lastPath, Map<String, String>? params}) {
    var fullUrl = "${ApiConfig.baseUrl}$path";
    if (lastPath.isNotEmpty) {
      // fullUrl +=
      //     '$lastPath?lang=${DynamicLanguage.selectedLanguage.value}';
      if (params != null && params.isNotEmpty) {
        fullUrl +=
            '$lastPath?${params.entries.map((e) => '${e.key}=${e.value}').join('&')}&lang=${DynamicLanguage.selectedLanguage.value}';
      } else {
        fullUrl += '$lastPath?lang=${DynamicLanguage.selectedLanguage.value}';
      }
    } else {
      if (params != null && params.isNotEmpty) {
        fullUrl +=
            '?${params.entries.map((e) => '${e.key}=${e.value}').join('&')}&lang=${DynamicLanguage.selectedLanguage.value}';
      } else {
        fullUrl += '?lang=${DynamicLanguage.selectedLanguage.value}';
      }
    }
    return fullUrl;
  }

  /// Convenience method to append query parameters
  String withParams(Map<String, String> params) => url(params: params);
  String addPath(String lastPath) => addUrl(lastPath: lastPath);
}

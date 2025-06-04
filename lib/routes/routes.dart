import 'package:get/get.dart';
import 'package:beautyTn/bindings/splash_binding.dart';
import 'package:beautyTn/bindings/two_fa_binding.dart';
import 'package:beautyTn/views/navigation/screen/navigation_screen.dart';
import 'package:beautyTn/views/splash/screen/splash_screen.dart';

import '../bindings/booking_detail_binding.dart';
import '../bindings/appointment_preview_binding.dart';
import '../bindings/forgot_password_binding.dart';
import '../bindings/location_permission_binding.dart';
import '../bindings/login_binding.dart';
import '../bindings/navigation_binding.dart';
import '../bindings/notification_binding.dart';
import '../bindings/onboard_binding.dart';
import '../bindings/otp_verification_binding.dart';
import '../bindings/password_change_binding.dart';
import '../bindings/profile_binding.dart';
import '../bindings/reg_email_binding.dart';
import '../bindings/registration_binding.dart';
import '../bindings/salon_details_binding.dart';
import '../bindings/schedule_binding.dart';
import '../bindings/services_binding.dart';
import '../bindings/settings_binding.dart';
import '../bindings/two_fa_verification_binding.dart';
import '../bindings/update_profile_binding.dart';
import '../views/booking_detail/screen/booking_detail_screen.dart';
import '../views/appointment_preview/screen/appointment_preview_screen.dart';
import '../views/auth/forgot_password/screen/forgot_password_screen.dart';
import '../views/auth/login/screen/login_screen.dart';
import '../views/auth/otp_verification/screen/otp_verification_screen.dart';
import '../views/auth/registration/screen/registration_screen.dart';
import '../views/auth/registration_email_verify/screen/registration_email_verify_screen.dart';
import '../views/auth/reset_password/screen/reset_password_screen.dart';
import '../views/auth/two_fa/screen/two_fa_screen.dart';
import '../views/auth/two_fa_verification_screen/screen/two_fa_verification_screen_screen.dart';
import '../views/change_password/screen/change_password_screen.dart';
import '../views/location_permission/screen/location_permission_screen.dart';
import '../views/notification/screen/notification_screen.dart';
import '../views/onboard/screen/onboard_screen.dart';
import '../views/salon_details/screen/salon_details_screen.dart';
import '../views/schedule/screen/schedule_screen.dart';
import '../views/services/screen/services_screen.dart';
import '../views/settings/screen/settings_screen.dart';
import '../views/update_profile/screen/update_profile_screen.dart';

part '../routes/route_pages.dart';

class Routes {
  // Page List
  static var list = RoutePageList.list;

  // Route Names
  static const String splashScreen = '/splashScreen';
  static const String onboardScreen = '/onboardScreen';
  static const String navigation = '/navigation';

  static const String loginScreen = '/loginScreen';
  static const String otpVerificationScreen = '/otpVerificationScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String registrationScreen = '/registrationScreen';
  static const String registrationEmailVerifyScreen =
      '/registrationEmailVerifyScreen';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String kycInformationScreen = '/kycInformationScreen';

  static const String twoFaScreen = '/twoFaScreen';
  static const String twoFaVerificationScreenScreen =
      '/twoFaVerificationScreenScreen';

  static const String locationPermissionScreen = '/locationPermissionScreen';
  static const String bookingsScreen = '/bookingsScreen';
  static const String findScreen = '/findScreen';
  static const String profileScreen = '/profileScreen';
  static const String update_profileScreen = '/update_profileScreen';
  static const String settingsScreen = '/settingsScreen';
  static const String servicesScreen = '/servicesScreen';
  static const String changePasswordScreen = '/ChangePasswordScreen';
  static const String salonDetailsScreen = '/salon_detailsScreen';
  static const String appointmentPreviewScreen = '/appointment_previewScreen';
  static const String bookingDetailScreen = '/BookingDetailScreen';
  static const String notificationScreen = '/notificationScreen';
  static const String scheduleScreen = '/scheduleScreen';
}

part of '../routes/routes.dart';

class RoutePageList {
  static var list = [
    GetPage(
      name: Routes.scheduleScreen,
      page: () => const ScheduleScreen(),
      binding: ScheduleBinding(),
    ),
    
    GetPage(
      name: Routes.notificationScreen,
      page: () => const NotificationScreen(),
      binding: NotificationBinding(),  
    ),
    
    GetPage(
      name: Routes.bookingDetailScreen,
      page: () => const BookingDetailScreen(),
      binding: BookingDetailBinding(),
    ),
    
    GetPage(
      name: Routes.appointmentPreviewScreen,
      page: () => const AppointmentPreviewScreen(),
      binding: AppointmentPreviewBinding(),
    ),
    
    GetPage(
      name: Routes.salonDetailsScreen,
      page: () => const SalonDetailsScreen(),
      binding: SalonDetailsBinding(),
    ),
    
    GetPage(
      name: Routes.changePasswordScreen,
      page: () => const ChangePasswordScreen(),
      binding: PasswordChangeBinding(),
    ),

    GetPage(
      name: Routes.servicesScreen,
      page: () => const ServicesScreen(),
      binding: ServicesBinding(),
    ),
    
    GetPage(
      name: Routes.settingsScreen,
      page: () => const SettingsScreen(),
      binding: SettingsBinding(),
    ),
    
    GetPage(
      name: Routes.update_profileScreen,
      page: () => const UpdateProfileScreen(),
      binding: UpdateProfileBinding(),
    ),
    GetPage(
      name: Routes.locationPermissionScreen,
      page: () => const LocationPermissionScreen(),
      binding: LocationPermissionBinding(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBindings(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.onboardScreen,
      page: () => OnboardScreen(),
      bindings: [
        OnboardBinding(),
        LoginBindings(),
        RegistrationBinding(),
      ],
    ),
    GetPage(
      name: Routes.navigation,
      page: () => NavigationScreen(),
      bindings: [
        ProfileBinding(),
        NavigationBinding()
      ]
    ),

    GetPage(
      name: Routes.otpVerificationScreen,
      page: () => const OtpVerificationScreen(),
      binding: OtpVerificationBinding(),
    ),
    GetPage(
      name: Routes.resetPasswordScreen,
      page: () => const ResetPasswordScreen(),
      // binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: Routes.registrationScreen,
      page: () => const RegistrationScreen(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: Routes.registrationEmailVerifyScreen,
      page: () => const RegistrationEmailVerifyScreen(),
      binding: RegistrationEmailBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.twoFaScreen,
      page: () => const TwoFaScreen(),
      binding: TwoFaBinding(),
    ),
    GetPage(
      name: Routes.twoFaVerificationScreenScreen,
      page: () => const TwoFaVerificationScreenScreen(),
      binding: TwoFaVerificationBinding(),
    ),
  ];
}

import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/screens/admin_dashboard/admin_dashboard_screen.dart';
import 'package:hpn_pay_project_avestan/screens/auth/phone_auth.dart';
import 'package:hpn_pay_project_avestan/screens/auth/phone_auth_otp.dart';

part './app_routes.dart';

abstract class AppPages {
  static const INITIAL = Routes.PHONE_AUTH_SCREEN;

  static final pages = [
    GetPage(
      name: Routes.PHONE_AUTH_SCREEN,
      page: () =>  PhoneAuthScreen(),
    ),
    GetPage(
      name: Routes.PHONE_AUTH_OTP_SCREEN,
      page: () =>  PhoneAuthOtpScreen(),
    ),
    GetPage(
        name: Routes.ADMIN_DASHBOARD_SCREEN,
      page: () => AdminDashboardScreen(),
    ),
    
  ];
}

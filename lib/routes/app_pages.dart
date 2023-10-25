import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/screens/admin_dashboard/admin_dashboard_screen.dart';
import 'package:hpn_pay_project_avestan/screens/admin_dashboard/components/create_company_page.dart';
import 'package:hpn_pay_project_avestan/screens/auth/phone_auth.dart';
import 'package:hpn_pay_project_avestan/screens/auth/phone_auth_otp.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/company_admin_dashboard_screen.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/company_dashboard_screen.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/company_create_form_dashboard.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/company_create_form_page.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/company_create_ledger_page.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/view_bank_ledger_profile.dart';

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
    GetPage(
        name: Routes.ADMIN_CREATE_COMPANY_PAGE,
      page: () => AdminCreateCompanyPage(),
    ),
    GetPage(
        name: Routes.COMPANY_DASHBOARD_SCREEN,
      page: () => CompanyDashboardScreen(),
    ),
    GetPage(
      name: Routes.COMPANY_CREATE_FORM_DASHBOARD,
      page: () => CompanyCreateFormDashboard(),
    ),
    GetPage(
      name: Routes.COMPANY_CREATE_FORM_PAGE,
      page: () => CompanyCreateFormPage(),
    ),
    GetPage(
        name: Routes.COMPANY_CREATE_LEDGER_PAGE,
      page: () => CompanyCreateLedgerPage(),
    ),
    GetPage(
        name: Routes.COMPANY_ADMIN_DASHBOARD_SCREEN,
      page: () => CompanyAdminDashBoardScreen(),
    ),
    GetPage(
        name: Routes.VIEW_BANK_LEDGER_PROFILE_PAGE,
      page: () => ViewBankLedgerProfilePage(),
    ),

    
  ];
}

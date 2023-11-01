import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/screens/admin_dashboard/admin_dashboard_screen.dart';
import 'package:hpn_pay_project_avestan/screens/admin_dashboard/components/create_company_page.dart';
import 'package:hpn_pay_project_avestan/screens/auth/phone_auth.dart';
import 'package:hpn_pay_project_avestan/screens/auth/phone_auth_otp.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create_ledger/company_create_ledger_dashboard.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/company_dashboard_screen.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/company_create_dashboard.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create_form/company_create_form_page.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create_ledger/employee/create_ledger_employee_aadharkyc_page.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create_ledger/employee/create_ledger_employee_ekyc_pageview.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create_ledger/employee/create_ledger_employee_manual_kyc_pageview.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create_ledger/employee/view_ledger_employee_profile.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create_ledger/party_bank/company_create_ledger_party_bank.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create_ledger/party_bank/view_party_bank_profile.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create_level/company_create_level_page.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create_loan/company_create_loan_dashboard.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create_loan/company_create_loan_page.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create_loan/company_view_loan_page.dart';

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
    // GetPage(
    //     name: Routes.COMPANY_DASHBOARD_SCREEN,
    //   page: () => CompanyDashboardScreen(title: 'Company Name',),
    // ),
    GetPage(
      name: Routes.COMPANY_CREATE_DASHBOARD,
      page: () => CompanyCreateDashboard(),
    ),
    GetPage(
      name: Routes.COMPANY_CREATE_FORM_PAGE,
      page: () => CompanyCreateFormPage(),
    ),

    GetPage(
        name: Routes.COMPANY_CREATE_LEDGER_PARTY_BANK_PAGE,
      page: () => CompanyCreateLedgerPartyBankPage(),
    ),
    GetPage(
        name: Routes.COMPANY_CREATE_LEDGER_DASHBOARD,
      page: () => CompanyCreateLedgerDashboard(),
    ),
    GetPage(
        name: Routes.VIEW_BANK_LEDGER_PROFILE_PAGE,
      page: () => ViewBankLedgerProfilePage(),
    ),
    GetPage(
        name: Routes.CREATE_lEDGER_EMPLOYEE_AADHARKYC_PAGE,
      page: () => CreateLedgerEmployeeAadharKycPage(),
    ),
    GetPage(
        name: Routes.CREATE_lEDGER_EMPLOYEE_EKYC_PAGEVIEW,
      page: () => CreateLedgerEmployeeEkycPageView(),
    ),
    GetPage(
        name: Routes.CREATE_lEDGER_EMPLOYEE_MANUAL_KYC_PAGEVIEW,
      page: () => CreateLedgerEmployeeManualKycPageView(),
    ),
    GetPage(
        name: Routes.VIEW_lEDGER_EMPLOYEE_PROFILE,
      page: () => ViewLedgerEmployeeProfilePage(),
    ),

    GetPage(
        name: Routes.COMPANY_CREATE_LOAN_DASHBOARD,
      page: () => CompanyCreateLoanDashboard(),
    ),
    GetPage(
        name: Routes.COMPANY_CREATE_LOAN_PAGE,
      page: () => CompanyCreateLoanPage(),
    ),
    GetPage(
        name: Routes.COMPANY_VIEW_LOAN_PAGE,
      page: () => CompanyViewLoanPage(),
    ),
    GetPage(
        name: Routes.COMPANY_CREATE_LEVEL_PAGE,
      page: () => CompanyCreateLevelPage(),
    ),

    
  ];
}

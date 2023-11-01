import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_button.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_checkbox.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_dropdown.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_profile_appbar.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_text_asteric.dart';
import 'package:hpn_pay_project_avestan/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/company_drawer.dart';

class CompanyCreateLedgerDashboard extends StatefulWidget {
  CompanyCreateLedgerDashboard({super.key});

  @override
  State<CompanyCreateLedgerDashboard> createState() =>
      _CompanyCreateLedgerDashboardState();
}

class _CompanyCreateLedgerDashboardState
    extends State<CompanyCreateLedgerDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String dropdownSelectForm = 'Select Form';

  // Selected value
  List<String> formTypes = [
    'Select Form',
    'Add new form',
    'Party(Bank)',
    'Employee',
    'Distributor',
    'Agent',
  ];

  final List<String> defaultFormNameList = <String>[
    'Priya Sharma Default',
    'Nidhi Kapse Default',
    'Revait Rane Default',
  ];
  final List<String> partyBankFormNameList = <String>[
    'Revait Rane Party(Bank)',
    'Priya Sharma Party(Bank)',
    'Nidhi Kapse Party(Bank)',
  ];
  final List<String> employeeFormNameList = <String>[
    'Revait Rane Employee',
    'Priya Sharma Employee',
    'Nidhi Kapse Employee',
  ];
  final List<String> distributerFormNameList = <String>[
    'Revait Rane Distributer',
    'Priya Sharma Distributer',
    'Nidhi Kapse Distributer',
  ];
  final List<String> agentFormNameList = <String>[
    'Revait Rane Agent',
    'Priya Sharma Agent',
    'Nidhi Kapse Agent',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      key: _scaffoldKey,
      drawer: CompanyDrawerWidget(),
      appBar: CustomProfileAppBar(scaffoldKey: _scaffoldKey,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRichText(
            text: 'Select Form',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomDropdown(
            hintText: 'Select Form',
            value: dropdownSelectForm,
            items: formTypes,
            onChanged: (String? val) {
              setState(() {
                dropdownSelectForm = val ?? 'Select Form';
                navigateToSelectedScreen(
                    dropdownSelectForm); // Navigate to the selected screen
              });
            },
          ),
          20.heightBox,
          Row(
            children: [
              'Ledgers'.text.color(primaryColor).bold.make(),
              Spacer(),
              Text(
                'Choose Position',
                style:
                    TextStyle(color: blackColor.withOpacity(0.4), fontSize: 10),
              ),
              const SizedBox(width: 5),
              Container(
                height: 18,
                width: 18,
                color: primaryColor,
                child: Icon(Icons.keyboard_arrow_down,
                    color: whiteColor, size: 16),
              ).onTap(() {
                // if (dropdownKey.currentState != null) {
                //   dropdownKey.currentState.openContainer();
                // }
              })
            ],
          ),
          20.heightBox,
          if (dropdownSelectForm == 'Add new form') ...[
            ListView.builder(
                shrinkWrap: true,
                itemCount: defaultFormNameList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/profile.jpg',
                            height: 34,
                            width: 34,
                          ),
                          5.widthBox,
                          defaultFormNameList[index]
                              .text
                              .semiBold
                              .size(14)
                              .color(blackColor)
                              .make(),
                          Spacer(),
                          CustomButton(
                            onPress: () =>
                                Get.toNamed(Routes.VIEW_BANK_LEDGER_PROFILE_PAGE),
                            borderRadius: 3,
                            padding: EdgeInsets.all(4),
                            width: 100,
                            height: 30,
                            textSize: 8,
                            text: 'View Details',
                            textColor: whiteColor,
                            backgroundColor: primaryColor,
                          )
                        ],
                      ).onTap(() {
                        // Get.toNamed(Routes.COMPANY_DASHBOARD_SCREEN);
                      }),
                      20.heightBox,
                    ],
                  );
                })
          ] else if (dropdownSelectForm == 'Party(Bank)') ...[
            ListView.builder(
                shrinkWrap: true,
                itemCount: partyBankFormNameList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/profile.jpg',
                            height: 34,
                            width: 34,
                          ),
                          5.widthBox,
                          partyBankFormNameList[index]
                              .text
                              .semiBold
                              .size(14)
                              .color(blackColor)
                              .make(),
                          Spacer(),
                          CustomButton(
                            onPress: () =>
                                Get.toNamed(Routes.VIEW_BANK_LEDGER_PROFILE_PAGE),
                            borderRadius: 3,
                            padding: EdgeInsets.all(4),
                            width: 100,
                            height: 30,
                            textSize: 8,
                            text: 'View Details',
                            textColor: whiteColor,
                            backgroundColor: primaryColor,
                          )
                        ],
                      ).onTap(() {
                        // Get.toNamed(Routes.COMPANY_DASHBOARD_SCREEN);
                      }),
                      20.heightBox,
                    ],
                  );
                })
          ] else if (dropdownSelectForm == 'Employee') ...[
            ListView.builder(
                shrinkWrap: true,
                itemCount: employeeFormNameList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/profile.jpg',
                            height: 34,
                            width: 34,
                          ),
                          5.widthBox,
                          employeeFormNameList[index]
                              .text
                              .semiBold
                              .size(14)
                              .color(blackColor)
                              .make(),
                          Spacer(),
                          CustomButton(
                            onPress: () =>
                                Get.toNamed(Routes.VIEW_lEDGER_EMPLOYEE_PROFILE),
                            borderRadius: 3,
                            padding: EdgeInsets.all(4),
                            width: 100,
                            height: 30,
                            textSize: 8,
                            text: 'View Details',
                            textColor: whiteColor,
                            backgroundColor: primaryColor,
                          )
                        ],
                      ),
                      20.heightBox,
                    ],
                  );
                })
          ] else if (dropdownSelectForm == 'Distributor') ...[
            ListView.builder(
                shrinkWrap: true,
                itemCount: distributerFormNameList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/profile.jpg',
                            height: 34,
                            width: 34,
                          ),
                          5.widthBox,
                          distributerFormNameList[index]
                              .text
                              .semiBold
                              .size(14)
                              .color(blackColor)
                              .make(),
                          Spacer(),
                          CustomButton(
                            onPress: () =>
                                Get.toNamed(Routes.VIEW_BANK_LEDGER_PROFILE_PAGE),
                            borderRadius: 3,
                            padding: EdgeInsets.all(4),
                            width: 100,
                            height: 30,
                            textSize: 8,
                            text: 'View Details',
                            textColor: whiteColor,
                            backgroundColor: primaryColor,
                          )
                        ],
                      ).onTap(() {
                        // Get.toNamed(Routes.COMPANY_DASHBOARD_SCREEN);
                      }),
                      20.heightBox,
                    ],
                  );
                })
          ] else if (dropdownSelectForm == 'Agent') ...[
            ListView.builder(
                shrinkWrap: true,
                itemCount: agentFormNameList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/profile.jpg',
                            height: 34,
                            width: 34,
                          ),
                          5.widthBox,
                          agentFormNameList[index]
                              .text
                              .semiBold
                              .size(14)
                              .color(blackColor)
                              .make(),
                          Spacer(),
                          CustomButton(
                            onPress: () =>
                                Get.toNamed(Routes.VIEW_BANK_LEDGER_PROFILE_PAGE),
                            borderRadius: 3,
                            padding: EdgeInsets.all(4),
                            width: 100,
                            height: 30,
                            textSize: 8,
                            text: 'View Details',
                            textColor: whiteColor,
                            backgroundColor: primaryColor,
                          )
                        ],
                      ).onTap(() {
                        // Get.toNamed(Routes.COMPANY_DASHBOARD_SCREEN);
                      }),
                      20.heightBox,
                    ],
                  );
                })
          ] else ...[
            ListView.builder(
                shrinkWrap: true,
                itemCount: defaultFormNameList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/profile.jpg',
                            height: 34,
                            width: 34,
                          ),
                          5.widthBox,
                          defaultFormNameList[index]
                              .text
                              .semiBold
                              .size(14)
                              .color(blackColor)
                              .make(),
                          Spacer(),
                          CustomButton(
                            onPress: () =>
                                Get.toNamed(Routes.VIEW_BANK_LEDGER_PROFILE_PAGE),
                            borderRadius: 3,
                            padding: EdgeInsets.all(4),
                            width: 100,
                            height: 30,
                            textSize: 8,
                            text: 'View Details',
                            textColor: whiteColor,
                            backgroundColor: primaryColor,
                          )
                        ],
                      ).onTap(() {
                        // Get.toNamed(Routes.COMPANY_DASHBOARD_SCREEN);
                      }),
                      20.heightBox,
                    ],
                  );
                })
          ],
        ],
      ).p16(),
    );
  }

  void navigateToSelectedScreen(String selectedForm) {
    if (selectedForm == 'Add new form') {
      // Navigate to the "AddNewFormScreen"
      Get.toNamed(Routes.COMPANY_CREATE_FORM_PAGE);
    } else if (selectedForm == 'Party(Bank)') {
      // Navigate to the "PartyBankScreen"
      Get.toNamed(Routes.COMPANY_CREATE_LEDGER_PARTY_BANK_PAGE);
    } else if (selectedForm == 'Employee') {
      // Navigate to the "EmployeeScreen"
      Get.toNamed(Routes.CREATE_lEDGER_EMPLOYEE_AADHARKYC_PAGE);
    } else if (selectedForm == 'Agent') {
      // Navigate to the "AgentScreen"
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_button.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_listtile.dart';
import 'package:hpn_pay_project_avestan/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

class CompanyDrawerWidget extends StatefulWidget {
  @override
  _CompanyDrawerWidgetState createState() => _CompanyDrawerWidgetState();
}

class _CompanyDrawerWidgetState extends State<CompanyDrawerWidget> {
  bool createExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      backgroundColor: whiteColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: whiteColor,
                ),
                child: Image.asset(
                  'assets/images/logo.jpeg',
                  height: 279,
                  width: 189,
                ),
              ),
              buildListTile(
                  icon: 'assets/icons/dashboard.png',
                  title: 'Dashboard',
                  onTap: () {
                    Navigator.pop(context);
                  },
                  selected: false,
                  leading: false),
              5.heightBox,
              buildListTile(
                icon: 'assets/icons/create.png',
                title: 'Create',
                onTap: () {

                  Get.toNamed(Routes.COMPANY_CREATE_FORM_DASHBOARD);

                  setState(() {
                    createExpanded = !createExpanded;
                  });
                },
                selected: false,
                leading: false,
                trailing: Icon(
                  createExpanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  color: blackColor,
                  size: 26,
                ),
              ),
              5.heightBox,
              if (createExpanded)
                Column(
                  children: [
                    buildListTile(
                      icon: 'assets/icons/create.png',
                      title: 'Create Form',
                      onTap: () {
                        Get.toNamed(Routes.COMPANY_CREATE_FORM_PAGE);
                      },
                      selected: false,
                      leading:
                          true, // Change this to true for the selected item
                    ),
                    buildListTile(
                      icon: 'assets/icons/create_ledger.png',
                      title: 'Create Ledger',
                      onTap: () {
                        // Get.toNamed(Routes.COMPANY_CREATE_LEDGER_PAGE);
                        Get.toNamed(Routes.COMPANY_ADMIN_DASHBOARD_SCREEN);
                      },
                      selected: false,
                      leading:
                          true, // Change this to true for the selected item
                    ),
                    buildListTile(
                      icon: 'assets/icons/create_loan.png',
                      title: 'Create Loan',
                      onTap: () {
                        Navigator.pop(context);
                        // Handle the 'Create Loan' action here
                      },
                      selected: false,
                      leading:
                          true, // Change this to true for the selected item
                    ),
                    buildListTile(
                      icon: 'assets/icons/create_level.png',
                      title: 'Create Level',
                      onTap: () {
                        Navigator.pop(context);
                        // Handle the 'Create Level' action here
                      },
                      selected: false,
                      leading:
                          true, // Change this to true for the selected item
                    ),
                  ],
                ),
              buildListTile(
                  icon: 'assets/icons/career.png',
                  title: 'Career',
                  onTap: () {
                    Navigator.pop(context);
                  },
                  selected: false,
                  leading: false),
              5.heightBox,
              buildListTile(
                  icon: 'assets/icons/balancesheet.png',
                  title: 'Balancesheet',
                  onTap: () {
                    Navigator.pop(context);
                  },
                  selected: false,
                  leading: false),
              5.heightBox,
              buildListTile(
                  icon: 'assets/icons/profitloss.png',
                  title: 'Profit & Loss',
                  onTap: () {
                    Navigator.pop(context);
                  },
                  selected: false,
                  leading: false),
              5.heightBox,
              buildListTile(
                  icon: 'assets/icons/report.png',
                  title: 'Report',
                  onTap: () {
                    Navigator.pop(context);
                  },
                  selected: false,
                  leading: false),
              5.heightBox,
              Container(
                height: 1,
                color: Colors.grey.withOpacity(0.3),
              ),
              5.heightBox,
              buildListTile(
                  icon: 'assets/icons/help_flag.png',
                  title: 'Help',
                  onTap: () {
                    Navigator.pop(context);
                  },
                  selected: false,
                  leading: false),
              5.heightBox,
              buildListTile(
                  icon: 'assets/icons/logout.png',
                  title: 'Logout',
                  onTap: () {
                    Navigator.pop(context);
                  },
                  selected: false,
                  leading: false),
              5.heightBox,
              Container(
                height: 1,
                color: Colors.grey.withOpacity(0.3),
              ),
              5.heightBox,
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    'Found an bug?'
                        .text
                        .semiBold
                        .color(primaryColor)
                        .size(20)
                        .make(),
                    5.heightBox,
                    'Report now to us if you find any bugs'
                        .text
                        .color(Colors.grey.withOpacity(0.6))
                        .size(8)
                        .make(),
                    15.heightBox,
                    CustomButton(
                      width: double.infinity,
                      borderRadius: 8,
                      backgroundColor: primaryColor,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/danger.png'),
                          5.widthBox,
                          'Report'.text.white.make()
                        ],
                      ),
                    )
                  ],
                )
                    .box
                    .color(Colors.grey.withOpacity(0.2))
                    .padding(EdgeInsets.all(18))
                    .roundedSM
                    .make(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

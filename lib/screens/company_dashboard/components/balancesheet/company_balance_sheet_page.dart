import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_button.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_profile_appbar.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/widgets/company_drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class CompanyBalanceSheet extends StatelessWidget {
  CompanyBalanceSheet({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: whiteColor,
      drawer: CompanyDrawerWidget(),
      appBar: CustomProfileAppBar(
        scaffoldKey: _scaffoldKey,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomButton(
                  borderRadius: 2,
                  height: 32,
                  width: 170,
                  backgroundColor: primaryColor,
                  text: 'Liability',
                  textColor:
                      whiteColor // Change text color for the first tab
                  ),
              Gap(10),
              'Capital Account'.text.size(16).semiBold.black.make(),
              Gap(10),
              'Share Capital'.text.make(),
              Gap(10),
              'Reserve Capital'.text.make(),
              Gap(10),
              'Loan Account'.text.size(16).semiBold.black.make(),
              Gap(10),
              'Bank OD A/C'.text.make(),
              Gap(10),
              'Bank CC A/C'.text.make(),
              Gap(10),
              'Secured Loan'.text.make(),
              Gap(10),
              'Unsecured Loan'.text.make(),
              Gap(10),
              'Loan From director'.text.make(),
              Gap(10),
              'Loan From Share holder'.text.make(),
              Gap(10),
              'Current Liabilities'.text.size(16).semiBold.black.make(),
              Gap(10),
              'Duty & Taxes'.text.make(),
              Gap(10),
              'Provision'.text.make(),
              Gap(10),
              'Sunday Creditors'.text.make(),
              Gap(10),
              'Deffed Tax'.text.make(),
              Gap(10),
              'Net Profit'.text.size(16).semiBold.black.make(),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomButton(
                  borderRadius: 2,
                  height: 32,
                  width: 170,
                  backgroundColor: primaryColor,
                  text: 'Assets',
                  textColor:
                      whiteColor // Change text color for the first tab
                  ),
              Gap(10),
              'Fixed Assets'.text.make(),
              Gap(10),
              'Current Assets'.text.make(),
              Gap(10),
              'Closing Stock'.text.make(),Gap(10),
              'Deposit'.text.make(),Gap(10),
              'Loan & Advance'.text.make(),Gap(10),
              'Sunday Debtors'.text.make(),Gap(10),
              'Cash in Hand'.text.make(), Gap(10),
              'Bank Account'.text.make(),
              Gap(10),
              'Net loss'.text.size(16).semiBold.black.make(),
              Gap(10),
              'Pre-operative Expenses'.text.size(16).semiBold.black.make(),
            ],
          ),
        ],
      ).p16(),
    );
  }
}

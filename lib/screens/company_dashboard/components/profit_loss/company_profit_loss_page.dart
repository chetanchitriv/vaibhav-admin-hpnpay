import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_button.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_profile_appbar.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/widgets/company_drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class CompanyProfitLossPage extends StatelessWidget {
  CompanyProfitLossPage({super.key});

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gap(10),
              'Opening Stock'.text.size(16).make(),
              Gap(10),
              'Purchase'.text.size(16).make(),
              Gap(10),
              'Direc Expense'.text.size(16).make(),
              Gap(10),
              'Gross Profit'.text.size(16).make(),
              Gap(10),
              'Indirect Expenses'.text.size(16).make(),
              ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gap(10),
              'Sales'.text.size(16).make(),
              Gap(10),
              'Direct Income'.text.size(16).make(),
              Gap(10),
              'Closing Stock'.text.size(16).make(),Gap(10),
              'Gross Loss'.text.size(16).make(),Gap(10),
              'Indirect Income'.text.size(16).make()
            ],
          ),
        ],
      ).p16(),
    );
  }
}

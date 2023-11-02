import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_profile_appbar.dart';
import 'package:hpn_pay_project_avestan/routes/app_pages.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/widgets/company_drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class CompanyCreateDashboard extends StatelessWidget {
  CompanyCreateDashboard({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> icons = <String>['assets/icons/create_form.png','assets/icons/create_group.png','assets/icons/create_loan.png','assets/icons/create_level.png'];
  final List<String> companyCreateFormTitle = <String>[
    'Create Form',
    'Create Ledger',
    'Create Loan',
    'Create Level',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      key: _scaffoldKey,
      drawer: CompanyDrawerWidget(),
      appBar: CustomProfileAppBar(scaffoldKey: _scaffoldKey,),
      body: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
            2, // You can change the number of columns as needed
            mainAxisSpacing: 16,
            crossAxisSpacing: 16),
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: companyCreateFormTitle.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                icons[index],
                height: 40,
                width: 40,
                color: Colors.black,
              )
                  .box
                  .color(Colors.grey.withOpacity(0.4))
                  .roundedSM
                  .make(),
              20.heightBox,
              companyCreateFormTitle[index].text.bold.black.size(18).make(),
            ],
          ).box.color(Color(0xFFF4F4F4)).p16.roundedSM.make().onTap(() {
            if (index == 0) {
              Get.toNamed(Routes.COMPANY_CREATE_FORM_PAGE);
            } else if (index == 1) {
              Get.toNamed(Routes.COMPANY_CREATE_LEDGER_DASHBOARD);
            } else if (index == 2) {
              Get.toNamed(Routes.COMPANY_CREATE_LOAN_DASHBOARD);
            } else if (index == 3) {
              Get.toNamed(Routes.COMPANY_CREATE_LEVEL_PAGE);

            }
          });
        },
      ),

    );
  }
}

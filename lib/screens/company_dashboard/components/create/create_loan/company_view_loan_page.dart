import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_appbar.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_button.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/company_dashboard_controller.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create/create_loan/company_view_loan_in_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';

class CompanyViewLoanPage extends StatelessWidget {
  CompanyViewLoanPage({super.key});

  List<String> loanTypeList = [
    'Wedding Loan',
    'Education Loan',
    'Smart Business Loan',
  ];
  List<String> benefitsList = [
    'Versatility',
    'No Collateral',
    'Quick approval',
  ];

  var companyViewLoanController = Get.put(CompanyDashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: CustomAppBar(
          onBackTap: Get.back,
          leading: Icon(Icons.arrow_back_ios, color: blackColor, size: 20),
          backgroundColor: whiteColor,
          // child: 'nsfsdf'.text.black.make(),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              'Personal Loan'.text.size(24).semiBold.make(),
              12.heightBox,
              Image.asset('assets/images/background.jpg',width: double.infinity,),
              12.heightBox,
              'Description'.text.size(24).semiBold.make(),
              16.heightBox,
              "Lorem ipsum dolor sit amet, consectectur adipiscing elit, sed do eiusmod tempor i"
                  .text
                  .make(),
              16.heightBox,
              'Type of Personal Loan'.text.size(24).semiBold.make(),
              12.heightBox,
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: loanTypeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomButton(
                          onPress: () { Get.to(()=>CompanyViewLoanInDetailPage(title: loanTypeList[index],));},
                          text: loanTypeList[index],
                          textColor: whiteColor,
                          backgroundColor: primaryColor,
                          borderRadius: 8,
                          height: 40,
                          width: 270,
                        ),
                        10.heightBox,
                      ],
                    );
                  }),
              16.heightBox,
              'Benefits'.text.size(24).semiBold.make(),
              12.heightBox,
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: loanTypeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/lend_loan.png',
                              height: 50,
                              width: 50,
                            ),
                            benefitsList[index]
                                .text
                                .size(18)
                                .color(Colors.black.withOpacity(0.6))
                                .make(),
                          ],
                        ),
                        6.heightBox,
                      ],
                    );
                  }),
            ],
          ).p16(),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_button.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_profile_appbar.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_text_asteric.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_textformfield.dart';
import 'package:hpn_pay_project_avestan/routes/app_pages.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/company_dashboard_controller.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/widgets/company_drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class CompanyCreateLoanDashboard extends StatelessWidget {
  CompanyCreateLoanDashboard({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> loanTypeTitle = <String>[
    'Personal Loan',
    'Home Loan',
  ];

  var createLoanController = Get.put(CompanyDashboardController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      key: _scaffoldKey,
      drawer: CompanyDrawerWidget(),
      appBar: CustomProfileAppBar(
        scaffoldKey: _scaffoldKey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRichText(text: 'Add Category'),
          6.heightBox,
          CustomFormField(
              controller: createLoanController.loanCategoryController, label: 'Loan Name'),
          10.heightBox,
          Align(
            alignment: Alignment.bottomRight,
            child: CustomButton(
              onPress: ()=> Get.toNamed(Routes.COMPANY_CREATE_LOAN_PAGE),
              borderRadius: 4,
              backgroundColor: primaryColor,
              height: 30,
              width: 100,
              text: 'Submit',
              textSize: 12,
              textColor: whiteColor,
            ),
          ),
          30.heightBox,
          'Prime Category'.text.size(20).semiBold.black.make(),
          20.heightBox,
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: (1.1 / 2),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: loanTypeTitle.length,
            itemBuilder: (BuildContext context, int index) {
              String longText =
                  "standard Personal Loan | Personal Loan for Debt Consolidation | Personal Loan for Medical Expenses | Personal Loan for Education | Wedding Loan | Travel Loan";

              // Calculate the required height based on the text content
              double textHeight = (longText.split("|").length * 20).toDouble();

              return Card(
                elevation: 0.6,
                semanticContainer: true,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: textHeight + -20, // Adjust this value as needed
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xFFF4F4F4),
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      const SizedBox(height: 20),
                      loanTypeTitle[index]
                          .text
                          .bold
                          .color(primaryColor)
                          .size(16)
                          .make(),
                      const SizedBox(height: 4),
                      Text(longText,
                          style: TextStyle(
                              color: blackColor.withOpacity(0.4), fontSize: 8)),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.center,
                        child: CustomButton(
                          onPress: ()=> Get.toNamed(Routes.COMPANY_VIEW_LOAN_PAGE),
                          borderRadius: 4,
                          backgroundColor: primaryColor,
                          height: 30,
                          width: 100,
                          text: 'View',
                          textSize: 12,
                          textColor: whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ).p16(),
    );
  }
}

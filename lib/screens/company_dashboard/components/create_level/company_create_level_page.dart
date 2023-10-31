import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_button.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_dropdown.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_profile_appbar.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_text_asteric.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_textformfield.dart';
import 'package:hpn_pay_project_avestan/routes/app_pages.dart';
import 'package:hpn_pay_project_avestan/screens/admin_dashboard/admin_dashboard_controller.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/widgets/company_drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class CompanyCreateLevelPage extends StatefulWidget {
  CompanyCreateLevelPage({Key? key}) : super(key: key);

  @override
  State<CompanyCreateLevelPage> createState() => _CompanyCreateLevelPageState();
}

class _CompanyCreateLevelPageState extends State<CompanyCreateLevelPage> {
  var adminDashboardController = Get.put(AdminDashboardController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      body: Form(
        key: adminDashboardController.formKey,
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: adminDashboardController.pageController,
          children: [
            firstFormPage(0),
            secondFormPage(1),
            // Add more pages as needed
          ],
        ),
      ),
    );
  }

  Widget firstFormPage(int page) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRichText(
            text: 'Level Number',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            height: 16,
            controller: adminDashboardController.levelNumberController,
            label: 'Level Number',
          ),
          8.heightBox,
          CustomRichText(
            text: 'Level Name',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            height: 16,
            controller: adminDashboardController.levelNameController,
            label: 'Level Name',
          ),
          6.heightBox,
          'Salary'.text.semiBold.size(20).make(),
          10.heightBox,
          CustomRichText(
            text: 'Minimum Salary',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            height: 16,
            controller: adminDashboardController.minimumSalaryController,
            label: 'Minimum Salary',
          ),
          8.heightBox,
          CustomRichText(
            text: 'Maximum Salary',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            height: 16,
            controller: adminDashboardController.maximumSalaryController,
            label: 'Maximum Salary',
          ),
          6.heightBox,
          "Target (In Lakh)".text.semiBold.size(20).make(),
          10.heightBox,
          CustomRichText(
            text: 'Type of Loan',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            height: 16,
            controller: adminDashboardController.typeOfLoanController,
            label: 'Type of Loan',
          ),
          8.heightBox,
          CustomRichText(
            text: 'Minimum file',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            height: 16,
            controller: adminDashboardController.minimumFileController,
            label: 'Minimum file',
          ),
          8.heightBox,
          CustomRichText(
            text: 'Amount',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            length: 10,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            // Pass it as a list
            inputType: TextInputType.number,
            height: 16,
            controller: adminDashboardController.amountTargetController,
            label: 'Amount in lakh',
          ),
          8.heightBox,
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 80,
              child: TextButton(
                  onPressed: () {
                    // if (adminDashboardController.formKey.currentState!
                    //     .validate()) {
                    if (page < 1) {
                      adminDashboardController.pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    } else {
                      // Handle form submission or navigation to the next screen
                      // based on your app logic.
                    }
                    // }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      'Next'.text.black.make(),
                      3.widthBox,
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 12,
                      )
                    ],
                  )),
            ),
          )
        ],
      ).p16(),
    );
  }

  Widget secondFormPage(int page) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          'Incentive'.text.semiBold.size(20).make(),
          10.heightBox,
          CustomRichText(
            text: 'Range',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRichText(
                    text: 'From',
                    textColor: primaryColor,
                    showAsterisk: false,
                  ),
                  2.heightBox,
                  SizedBox(
                    width: 153,
                    child: CustomFormField(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
                      inputType: TextInputType.number,
                      height: 16,
                      controller:
                      adminDashboardController.rangeFromController,
                      label: 'Amount in Lakh',
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRichText(
                    text: 'To',
                    textColor: primaryColor,
                    showAsterisk: false,
                  ),
                  2.heightBox,
                  SizedBox(
                    width: 153,
                    child: CustomFormField(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
                      inputType: TextInputType.number,
                      height: 16,
                      controller:adminDashboardController.rangeToController,

                      label: 'Amount in Lakh',
                    ),
                  ),
                ],
              ),
            ],
          ),
          8.heightBox,
          CustomRichText(
            text: 'Method of Payment',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomDropdown(
            hintText: 'Select',
            value: adminDashboardController.dropdownPaymentMethod,
            items: adminDashboardController.paymentMethodTypes,
            onChanged: (String? val) {
              setState(() {
                adminDashboardController.dropdownPaymentMethod = val ?? 'Select';
              });
            },
          ),

          8.heightBox,
          CustomRichText(
            text: 'Amount',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
            inputType: TextInputType.number,
            height: 16,
            controller:
            adminDashboardController.amountIncentiveController,
            label: 'Amount in Lakh',
          ),
          8.heightBox,
          CustomRichText(
            text: 'Additional',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomDropdown(
            hintText: 'Select',
            value: adminDashboardController.dropdownPaymentMethod,
            items: adminDashboardController.paymentMethodTypes,
            onChanged: (String? val) {
              setState(() {
                adminDashboardController.dropdownPaymentMethod = val ?? 'Select';
              });
            },
          ),

          8.heightBox,
          CustomRichText(
            text: 'Continue Performance',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          Row(
            children: [
              SizedBox(
                width: 170,
                child: CustomFormField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
                  inputType: TextInputType.number,
                  height: 16,
                  controller:
                  adminDashboardController.continuePerformanceController,
                  label: 'Enter',
                ),
              ),
              10.widthBox,
              'Month'.text.color(primaryColor).make()
            ],
          ),
          8.heightBox,
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: "(If employee continues with the target in the given months then they will be promote for next level of if they will not continues with the target then they will be promote down)".text.makeCentered(),
            ),
          ),
          8.heightBox,
          SizedBox(
            width: 80,
            child: TextButton(
                onPressed: () {
                  if (page > 0) {
                    adminDashboardController.pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  } else {
                    // Handle form submission or navigation to the next screen
                    // based on your app logic.
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 12,
                    ),
                    3.widthBox,
                    'Back'.text.black.size(12).make(),
                  ],
                )),
          ),
          // Spacer(),
          Obx(() {
            return Align(
              alignment: Alignment.center,
              child: CustomButton(
                isLoading: adminDashboardController.isButtonLoad.value,
                onPress: () {
                  if (page > 0) {
                    adminDashboardController.pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  } else {
                    // Handle form submission or navigation to the next screen
                    // based on your app logic.
                  }
                },
                height: 40,
                width: 160,
                backgroundColor: primaryColor,
                text: 'Submit',
                textColor: whiteColor,
                borderRadius: 22,
              ),
            );
          })
        ],
      ).p16(),
    );
  }
}

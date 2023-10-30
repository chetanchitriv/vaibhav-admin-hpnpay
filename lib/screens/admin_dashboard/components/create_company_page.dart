import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_button.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_text_asteric.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_textformfield.dart';
import 'package:hpn_pay_project_avestan/routes/app_pages.dart';
import 'package:hpn_pay_project_avestan/screens/admin_dashboard/admin_dashboard_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminCreateCompanyPage extends StatefulWidget {
  AdminCreateCompanyPage({Key? key}) : super(key: key);

  @override
  State<AdminCreateCompanyPage> createState() => _AdminCreateCompanyPageState();
}

class _AdminCreateCompanyPageState extends State<AdminCreateCompanyPage> {
  var adminDashboardController = Get.put(AdminDashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Company details').text.black.semiBold.make(),
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        elevation: 0,
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
            text: 'Company name',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            height: 16,
            controller: adminDashboardController.companyNameController,
            label: 'Company name',
          ),
          8.heightBox,
          CustomRichText(
            text: 'Mailing Name',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            height: 16,
            controller: adminDashboardController.mailingNameController,
            label: 'Mailing Name',
          ),
          6.heightBox,
          CustomRichText(
            text: 'Address',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            height: 16,
            controller: adminDashboardController.addressController,
            label: 'Address',
          ),
          8.heightBox,
          CustomRichText(
            text: 'State',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            height: 16,
            controller: adminDashboardController.stateController,
            label: 'State',
          ),
          6.heightBox,
          CustomRichText(
            text: 'City',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            height: 16,
            controller: adminDashboardController.cityController,
            label: 'City',
          ),
          8.heightBox,
          CustomRichText(
            text: 'Pincode',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            length: 6,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
            inputType: TextInputType.number,
            height: 16,
            controller: adminDashboardController.pinCodeController,
            label: 'Pincode',
          ),
          6.heightBox,
          CustomRichText(
            text: 'Telephone Number',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            length: 10,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
            inputType: TextInputType.number,
            height: 16,
            controller: adminDashboardController.telephoneNumberController,
            label: 'Telephone Number',
          ),
          8.heightBox,
          CustomRichText(
            text: 'Mobile Number',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            length: 10,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
            inputType: TextInputType.number,
            height: 16,
            controller: adminDashboardController.mobileNumberController,
            label: 'Mobile Number',
          ),
          6.heightBox,
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 80,
              child: TextButton(
                  onPressed: () {
                    if (adminDashboardController.formKey.currentState!
                        .validate()) {
                      if (page < 1) {
                        adminDashboardController.pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      } else {
                        // Handle form submission or navigation to the next screen
                        // based on your app logic.
                      }
                    }
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
          CustomRichText(
            text: 'Email Address',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            height: 16,
            controller: adminDashboardController.emailAddressController,
            label: 'Email Address',
          ),
          8.heightBox,
          CustomRichText(
            text: 'Website Address',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            height: 16,
            controller: adminDashboardController.websiteAddressController,
            label: 'Website Address',
          ),
          6.heightBox,
          CustomRichText(
            text: 'GST Number',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            height: 16,
            controller: adminDashboardController.gstNumberController,
            label: 'GST Number',
          ),
          8.heightBox,
          CustomRichText(
            text: 'License Name',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            height: 16,
            controller: adminDashboardController.licenseNameController,
            label: 'License Name',
          ),
          6.heightBox,
          CustomRichText(
            text: 'License Number',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            // Pass it as a list
            inputType: TextInputType.number,
            height: 16,
            controller: adminDashboardController.licenseNumberController,
            label: 'License Number',
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: adminDashboardController.licenses.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  8.heightBox,
                  CustomRichText(
                    text: 'License Name',
                    textColor: primaryColor,
                  ),
                  6.heightBox,
                  CustomFormField(
                    height: 16,
                    controller: adminDashboardController
                        .licenses[index].licenseNameListController,
                    label: 'License Name',
                  ),
                  8.heightBox,
                  CustomRichText(
                    text: 'License Number',
                    textColor: primaryColor,
                  ),
                  6.heightBox,
                  CustomFormField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    // Pass it as a list
                    inputType: TextInputType.number,
                    height: 16,
                    controller: adminDashboardController
                        .licenses[index].licenseNumberListController,
                    label: 'License Number',
                  ),
                ],
              );
            },
          ),

          10.heightBox,
          Align(
            alignment: Alignment.bottomRight,
            child: CustomButton(
              onPress: addLicenseField,
              borderRadius: 8,
              width: 120,
              height: 30,
              text: 'Add License',
              textColor: whiteColor,
              backgroundColor: primaryColor,
              textSize: 12,
            ),
          ),
          8.heightBox,
          CustomRichText(
            text: 'Pan Card Number',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            height: 16,
            controller: adminDashboardController.panCardController,
            label: 'Pan Card Number',
          ),

          6.heightBox,
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
                onPress: () async{
                  try {
                    adminDashboardController.isButtonLoad.value = true;

                    await adminDashboardController.createCompany(context);

                    adminDashboardController.isButtonLoad.value = false;

                  } catch (e) {
                    // Handle errors or show messages here
                    adminDashboardController.isButtonLoad.value = false;
                    print('Error: $e');
                  }},
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

  void addLicenseField() {
    adminDashboardController.licenses.add(LicenseData(
      licenseNameListController: TextEditingController(),
      licenseNumberListController: TextEditingController(),
    ));
    setState(() {});
  }
}

class LicenseData {
  final TextEditingController licenseNameListController;
  final TextEditingController licenseNumberListController;

  LicenseData({
    required this.licenseNameListController,
    required this.licenseNumberListController,
  });
}

import 'dart:convert';

import 'package:blurry/blurry.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/repository/api.dart';
import 'package:hpn_pay_project_avestan/repository/api_services.dart';
import 'package:hpn_pay_project_avestan/routes/app_pages.dart';
import 'package:hpn_pay_project_avestan/screens/admin_dashboard/components/create_company_page.dart';
import 'package:http/http.dart' as http;

class AdminDashboardController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final isButtonLoad = RxBool(false);

  String dropdownPaymentMethod = 'Select';

  // Selected value
  List<String> paymentMethodTypes = [
    'Select',
    'Online',
    'Offline',
  ];
  var companyNameController = TextEditingController();

  var mailingNameController = TextEditingController();

  var addressController = TextEditingController();

  var stateController = TextEditingController();

  var cityController = TextEditingController();

  var pinCodeController = TextEditingController();

  var telephoneNumberController = TextEditingController();

  var mobileNumberController = TextEditingController();

  var emailAddressController = TextEditingController();

  var websiteAddressController = TextEditingController();

  var gstNumberController = TextEditingController();

  var licenseNameController = TextEditingController();

  var licenseNumberController = TextEditingController();

  var panCardController = TextEditingController();

  final PageController pageController = PageController(initialPage: 0);

  List<LicenseData> licenses = [];

  var levelNumberController = TextEditingController();
  var levelNameController = TextEditingController();
  var minimumSalaryController = TextEditingController();
  var maximumSalaryController = TextEditingController();
  var typeOfLoanController = TextEditingController();
  var minimumFileController = TextEditingController();
  var amountTargetController = TextEditingController();
  var amountIncentiveController = TextEditingController();
  var rangeFromController = TextEditingController();
  var rangeToController = TextEditingController();
  var continuePerformanceController = TextEditingController();

  Future<void> createCompany(context) async {
    if (formKey.currentState!.validate()) {
      final url =
          Uri.parse("${ApiConstants.baseUrl}${ApiConstants.createCompany}");

      final Map<String, dynamic> requestData = {
        "companyName": companyNameController.text,
        "maillingName": mailingNameController.text,
        "address": addressController.text,
        "state": stateController.text,
        "city": cityController.text,
        "pinCode": int.parse(pinCodeController.text),
        "telephoneNumber": int.parse(telephoneNumberController.text),
        "mobileNumber": int.parse(mobileNumberController.text),
        "email": emailAddressController.text,
        "websiteAddress": websiteAddressController.text,
        "gstNumber": gstNumberController.text,
        "license": [
          {
            "licenseName": licenseNameController.text,
            "licenseNumber": licenseNumberController.text,
          }
        ],
        "panCardNumber": panCardController.text,
      };

      final body = ApiService.getRequestBody(requestData);
      final headers = ApiService.getHeaders();

      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final success = responseData["success"];
        final message = responseData["message"];

        if (success == true) {
          Blurry.success(
              title: 'Success',
              description: message,
              confirmButtonText: 'Okay',
              onConfirmButtonPressed: () {
                pageController.animateToPage(0,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
                Get.toNamed(Routes.ADMIN_DASHBOARD_SCREEN);
                companyNameController.clear();
                mailingNameController.clear();
                addressController.clear();
                stateController.clear();
                cityController.clear();
                pinCodeController.clear();
                telephoneNumberController.clear();
                mobileNumberController.clear();
                emailAddressController.clear();
                websiteAddressController.clear();
                gstNumberController.clear();
                licenseNameController.clear();
                licenseNumberController.clear();
                panCardController.clear();
              }).show(context);
        } else {
          // Handle the case where company creation failed
          Blurry.error(
              title: 'Failed',
              description: message,
              confirmButtonText: 'Okay',
              onConfirmButtonPressed: () {
                Get.back();
              }).show(context);
        }
      } else {
        // Handle the case where the request failed
        Blurry.info(
            title: 'Failed',
            description: 'Failed to create company, There is server side error',
            confirmButtonText: 'Okay',
            onConfirmButtonPressed: () {
              Get.back();
            }).show(context);
      }
    }
  }

  Future<List<Map<String, dynamic>>?> fetchCompanyData() async {
    final url =
        Uri.parse("${ApiConstants.baseUrl}${ApiConstants.getAllCompanies}");

    try {
      final headers = ApiService.getHeaders();

      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        // Convert the JSON data to a list of maps
        List<Map<String, dynamic>> companies =
            List<Map<String, dynamic>>.from(jsonData);

        return companies;
      } else {
        // Handle the response error, you can throw an exception or return null as needed
        return null;
      }
    } catch (e) {
      // Handle any network or API request errors
      print('Error: $e');
      return null;
    }
  }
}

import 'dart:convert';

import 'package:blurry/blurry.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/repository/api.dart';
import 'package:hpn_pay_project_avestan/repository/api_services.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create_form/company_form_data.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create_loan/company_create_loan_data.dart';
import 'package:http/http.dart' as http;

class CompanyDashboardController extends GetxController {
  final isButtonLoad = RxBool(false);
  bool switchValue = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final PageController pageController = PageController(initialPage: 0);


  var yesNoIndex = 0.obs;
  var loanCategoryController = TextEditingController();
  var loanBenefitsController = TextEditingController();


  var partyNameController = TextEditingController();

  var displayNameController = TextEditingController();

  var addressController = TextEditingController();

  var stateController = TextEditingController();

  var cityController = TextEditingController();

  var pinCodeController = TextEditingController();

  var mobileNumberController = TextEditingController();

  var emailAddressController = TextEditingController();

  var gstNumberController = TextEditingController();

  var updateUrlController = TextEditingController();

  var userIdController = TextEditingController();

  var passwordController = TextEditingController();

  var loanRangeFromController = TextEditingController();

  var loanRangeToController = TextEditingController();

  var amountController = TextEditingController();
  var remarkController = TextEditingController();

  yesNoGstIndex(index) {
    yesNoIndex.value = index;
  }

  var formNameController = TextEditingController();

  String dropdownValueCity = 'Select Group';
  String dropdownValuePrimaryCategory = 'Select';

  // Selected value
  String dropdownValueArea = 'Select Sub-group';

  // Selected value
  List<String> primaryCategories = [
    'Select',
    'Category1',
    'Category2',
    'Category3',
    'Category4',
  ];// Selected value
  List<String> city = [
    'Select Group',
    'Nagpur',
    'Pune',
    'Nashik',
    'Amravati',
    'Wardha',
  ];

  List<String> area = [
    'Select Sub-group',
    'Trimurti Nagar',
    'Pratap nagar',
    'Shrawan nagar',
    'Kharbi',
    'Dighori',
  ];

  List<CompanyFormListData> companyFormListData =
      CompanyFormListData.companyFormListData;

  List<CompanyLoanListData> companyLoanListData =
      CompanyLoanListData.companyLoanListData;

  Future<void> createForm(List<CompanyFormListData> selectedFields, context) async {
    if (formKey.currentState!.validate()) {

      final url = Uri.parse("${ApiConstants.baseUrl}${ApiConstants.createForm}");

    var formName = formNameController.text;
    var formGroup = dropdownValueCity;
    var formSubgroup = dropdownValueArea;

    final List<Map<String, String>> fields = selectedFields
        .where((field) => field.isSelected)
        .map((field) {
      print("Sending field: ${field.titleTxt}, Type: ${field.titleType}");
      return {
        "fieldName": field.titleTxt,
        "fieldType": field.titleType,
      };
    })
        .toList();

    final Map<String, dynamic> requestData = {
      "formName": formName,
      "formGroup": formGroup,
      "formSubgroup": formSubgroup,
      "fields": fields,
    };

    final body = ApiService.getRequestBody(requestData);
    print("Request Data: $body"); // Print the entire request body
    final headers = ApiService.getHeaders();

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = json.decode(response.body);
      final message = responseData["message"];
      final formStructure = responseData["formStructure"];

      selectedFields.forEach((field) => field.isSelected = false);
      formNameController.clear();

      Blurry.success(
          title: 'Success',
          description: message,
          confirmButtonText: 'Okay',
          onConfirmButtonPressed: () {
            Get.back();
            Get.back();
          }).show(context);
    } else {
      print("Failed to create form structure. Status code: ${response.statusCode}");
      // Handle the case where the request failed
      Blurry.error(
          title: 'Failed',
          description: 'Failed to create form',
          confirmButtonText: 'Okay',
          onConfirmButtonPressed: () {
            Get.back();
          }).show(context);
    }
  }}

}

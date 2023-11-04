import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create/data_classes/add_amount_field.dart';

class CompanyEmployeeController extends GetxController{
  final isButtonLoad = RxBool(false);
  bool switchValue = true;
  final GlobalKey<FormState> eKycFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> manualKycformKey = GlobalKey<FormState>();
  final PageController eKycPageController = PageController(initialPage: 0);
  final PageController manualKycPageController = PageController(initialPage: 0);



  List<RangeData> rangeList = [];
  List<LoanData> loanList = [];
  var remarkController = TextEditingController();

  var partyNameController = TextEditingController();

  var displayNameController = TextEditingController();

  var addressController = TextEditingController();

  var stateController = TextEditingController();

  var cityController = TextEditingController();

  var pinCodeController = TextEditingController();

  var mobileNumberController = TextEditingController();

  var emailAddressController = TextEditingController();
  var panCardController = TextEditingController();
  var genderController = TextEditingController();

  var bankNameController = TextEditingController();
  var bankHolderNameController = TextEditingController();
  var accountNumberController = TextEditingController();
  var ifscCodeController = TextEditingController();
  var levelController = TextEditingController();
  var salaryController = TextEditingController();
  var joiningDateController = TextEditingController();
  var targetController = TextEditingController();
  var loanTypeController = TextEditingController();
  var minimumFileController = TextEditingController();
  var amountController = TextEditingController();
  var payAmountController = TextEditingController();
  var continuePerformanceController = TextEditingController();

  var nameController = TextEditingController();
  var surnameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var addressEmployeeController = TextEditingController();

  var rangeFromController = TextEditingController();
  var rangeToController = TextEditingController();
  var amountIncentiveController = TextEditingController();

  var aadharNumberController = TextEditingController();

}
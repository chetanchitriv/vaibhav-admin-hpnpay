import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyDashboardController extends GetxController{
  var yesNoIndex = 0.obs;

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


  yesNoGstIndex(index) {
    yesNoIndex.value = index;
  }
}
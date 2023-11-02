import 'package:blurry/blurry.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/repository/api.dart';
import 'package:hpn_pay_project_avestan/repository/api_services.dart';
import 'package:hpn_pay_project_avestan/routes/app_pages.dart';
import 'package:hpn_pay_project_avestan/services/local_storage_services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthController extends GetxController {
  var phoneController = TextEditingController();

  List<TextEditingController> otpControllerList =
  List.generate(6, (index) => TextEditingController());
  final isButtonLoad = RxBool(false);

  void sendOTP(context) async {
    final phone = phoneController.text.trim();
    final url = Uri.parse('https://avestan-be.onrender.com/api/admin/verifyMobile');
    final body = ApiService.getRequestBody({"mobileNumber": int.parse(phone)});
    final headers = ApiService.getHeaders();

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = json.decode(response.body);
      final success = responseData["success"];
      final message = responseData["message"];

      if (success == true) {
        // OTP sent successfully, you can navigate to the next screen here
        Get.toNamed(Routes.PHONE_AUTH_OTP_SCREEN);
      } else {
        // Handle the case where OTP sending failed
        Blurry.error(
            title:  'Failed',
            description:message,
            confirmButtonText:  'Okay',
            onConfirmButtonPressed: () {
              Get.back();
            })
            .show(context);
      }
    } else {
      // Handle the case where the request failed
      Blurry.info(
          title:  'Failed',
          description:'OTP verification failed, There is server side error',
          confirmButtonText:  'Okay',
          onConfirmButtonPressed: () {
            Get.back();
          })
          .show(context);
    }
  }

  void verifyOTP(context) async {
    String otp = '';

    // getting all textfield data
    for (var i = 0; i < otpControllerList.length; i++) {
      otp += otpControllerList[i].text;
    }
    final url = Uri.parse("${ApiConstants.baseUrl}${ApiConstants.verifyOtp}");
    final body = ApiService.getRequestBody({"otp": int.parse(otp)}); // Parse OTP as an integer
    final headers = ApiService.getHeaders();

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final success = responseData["success"];
      final message = responseData["message"];

      if (success == true) {
        await StorageService.setUserType(true);
        Get.toNamed(Routes.ADMIN_DASHBOARD_SCREEN);
      } else {
        // Handle the case where OTP verification failed
        Blurry.error(
            title:  'Failed',
            description:message,
            confirmButtonText:  'Okay',
            onConfirmButtonPressed: () {
              Get.back();
            })
            .show(context);
      }
    } else {
      // Handle the case where the request failed
      Blurry.info(
          title:  'Failed',
          description:'OTP verification failed, There is server side error',
          confirmButtonText:  'Okay',
          onConfirmButtonPressed: () {
            Get.back();
          })
          .show(context);
    }
  }
}
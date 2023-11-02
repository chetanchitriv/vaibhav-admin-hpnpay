import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_button.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_textformfield.dart';
import 'package:hpn_pay_project_avestan/routes/app_pages.dart';
import 'package:hpn_pay_project_avestan/screens/auth/auth_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class PhoneAuthScreen extends StatelessWidget {
  PhoneAuthScreen({super.key});

  var authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
     body: Padding(
       padding: const EdgeInsets.all(20.0),
       child: SingleChildScrollView(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            100.heightBox,
            'Admin Login'.text.size(34).color(primaryColor).bold.make(),
            20.heightBox,
            Image.asset('assets/images/logo.png',height: 279,width: 189,),
            60.heightBox,
            Align(
              alignment: Alignment.topLeft,
                child: 'Mobile Number'.text.size(18).semiBold.color(primaryColor).make()),
            10.heightBox,
            CustomFormField(
              length: 10,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Use FilteringTextInputFormatter to allow only digits
              inputType: TextInputType.number,
              controller: authController.phoneController,
              label: 'Enter mobile no',
              hintText: '',
            ),
            40.heightBox,


              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  // onPress: ()=>  authController.sendOTP(context),
                  onPress: ()=>  Get.toNamed(Routes.PHONE_AUTH_OTP_SCREEN),
                  borderRadius: 4,
                  height: 48,
                  width: double.infinity,
                  text: 'GET OTP',
                  textColor: Colors.white,
                  backgroundColor: primaryColor,
                )
              )


          ],
         ),
       ),
     ),
    );
  }
}
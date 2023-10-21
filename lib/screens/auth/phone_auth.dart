import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_button.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_textfield.dart';
import 'package:hpn_pay_project_avestan/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

class PhoneAuthScreen extends StatelessWidget {
  PhoneAuthScreen({super.key});

var phoneController = TextEditingController();
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
            Image.asset('assets/images/logo.jpeg',height: 279,width: 189,),
            60.heightBox,
            Align(
              alignment: Alignment.topLeft,
                child: 'Mobile Number'.text.size(18).semiBold.color(primaryColor).make()),
            10.heightBox,
            CustomFormField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Use FilteringTextInputFormatter to allow only digits
              inputType: TextInputType.number,
              controller: phoneController,
              label: 'Enter mobile no',
              hintText: '',
            ),
            40.heightBox,
            CustomButton(
              onPress: ()=> Get.toNamed(Routes.PHONE_AUTH_OTP_SCREEN),
              borderRadius: 4,
              height: 48,
              width: double.infinity,
              text: 'GET OTP',
              textColor: Colors.white,
              backgroundColor: primaryColor,
            )

          ],
         ),
       ),
     ),
    );
  }
}
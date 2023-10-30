import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_button.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_textformfield.dart';
import 'package:hpn_pay_project_avestan/routes/app_pages.dart';
import 'package:hpn_pay_project_avestan/screens/auth/auth_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class PhoneAuthOtpScreen extends StatelessWidget {
  PhoneAuthOtpScreen({super.key});

  var authController = Get.put(AuthController());

  double fieldSpacing = 20.0;

  bool areFieldsFilled() {
    for (var controller in authController.otpControllerList) {
      if (controller.text.isEmpty) {
        return false;
      }
    }
    return true;
  }
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
                  child: 'Enter OTP'.text.size(18).semiBold.color(primaryColor).make()),
              10.heightBox,
              SizedBox(
                height: 40,
                width: double.infinity,
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    6,
                        (index) => Container(
                      width: 40,
                      margin: EdgeInsets.only(right: index < 5 ? fieldSpacing : 12),
                      child: TextFormField(
                        autocorrect: false,
                        autofocus: true,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                        ],
                        keyboardType: TextInputType.number,
                        controller: authController.otpControllerList[index],
                        cursorColor: Colors.indigo,
                        onChanged: (value) {
                          if (value.length == 1 && index <= 4) {
                            FocusScope.of(context).nextFocus();
                          } else if (value.isEmpty && index > 0) {
                            // FocusScope.of(context).previousFocus();
                          }
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            // VxToast.show(
                            //   context,
                            //   msg: 'Please enter a value',
                            //   position: VxToastPosition.center,
                            // );
                            // return 'Empty';
                          } else if (value.length != 1) {
                            VxToast.show(
                              context,
                              msg: 'Please enter only one digit',
                              position: VxToastPosition.center,
                            );
                            // return 'Empty';
                          }
                          return null;
                        },
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(color: Colors.black12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide:
                            BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(color: Colors.black12),
                          ),
                          // helperText: '',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              40.heightBox,
              CustomButton(
                onPress: ()=> authController.verifyOTP(context),
                borderRadius: 4,
                height: 48,
                width: double.infinity,
                text: 'VERIFY OTP',
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
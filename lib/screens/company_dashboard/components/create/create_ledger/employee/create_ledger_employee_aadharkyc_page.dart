import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_appbar.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_button.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_checkbox.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_dialogue.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_text_asteric.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_textformfield.dart';
import 'package:hpn_pay_project_avestan/routes/app_pages.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create/create_ledger/company_create_ledger_controller.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create/create_ledger/employee/company_employee_controller.dart';
import 'package:hpn_pay_project_avestan/services/image_services.dart';
import 'package:velocity_x/velocity_x.dart';

class CreateLedgerEmployeeAadharKycPage extends StatefulWidget {
  const CreateLedgerEmployeeAadharKycPage({super.key});

  @override
  State<CreateLedgerEmployeeAadharKycPage> createState() =>
      _CreateLedgerEmployeeAadharKycPageState();
}

class _CreateLedgerEmployeeAadharKycPageState
    extends State<CreateLedgerEmployeeAadharKycPage> {
  var aadharNumberController = TextEditingController();
  var aadharOTPController = TextEditingController();
  List<TextEditingController> otpControllerList =
  List.generate(6, (index) => TextEditingController());
  
  ImageSelector profile = ImageSelector();
  String? aadharBase64 = '';
  bool isAadharUploaded = false;

  String? panBase64 = '';
  bool isPanUploaded = false;

  var createLedgerEmployeeController = Get.put(CompanyEmployeeController());


  double fieldSpacing = 20.0;

  bool areFieldsFilled() {
    for (var controller in otpControllerList) {
      if (controller.text.isEmpty) {
        return false;
      }
    }
    return true;
  }
  bool? isEKycSelected = false;

  bool? isManualKycSelected = false;

  void onChangedEKyc(bool? newValue) {
    setState(() {
      isEKycSelected = newValue;
      isManualKycSelected = !newValue!;
    });
  }

  void onChangedManualKyc(bool? newValue) {
    setState(() {
      isEKycSelected = !newValue!;
      isManualKycSelected = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      appBar: CustomAppBar(
        onBackTap: Get.back,
        leading: Icon(Icons.arrow_back_ios, color: blackColor, size: 20),
        backgroundColor: whiteColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.heightBox,
          CustomRichText(
            text: 'Aadhar card',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          Row(
            children: [
              CustomCheckbox(
                label: 'E-KYC',
                value: isEKycSelected,
                onChanged: onChangedEKyc,
                borderRadius: BorderRadius.circular(50),
              ),
              CustomCheckbox(
                label: 'Manual KYC',
                value: isManualKycSelected,
                onChanged: onChangedManualKyc,
                borderRadius: BorderRadius.circular(50),
              ),
            ],
          ),
          Visibility(
            visible: isEKycSelected == true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                8.heightBox,
                CustomRichText(
                  text: 'Enter Aadhar number',
                  textColor: primaryColor,
                  showAsterisk: true,
                ),
                6.heightBox,
                CustomFormField(
                    length: 12,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
                    inputType: TextInputType.number,
                    controller: aadharNumberController, label: 'Aadhar Number',child: CustomButton(width: 30,backgroundColor: primaryColor,text: 'Get OTP',textColor: whiteColor,textSize: 10,borderRadius: 4,onPress: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        child: Container(
                          padding: const EdgeInsets.all(30.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              'Enter OTP'.text.size(18).semiBold.make(),
                              30.heightBox,
                              SizedBox(
                                height: 35,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(
                                    6,
                                        (index) => Container(
                                      width: 35,
                                      // margin: EdgeInsets.only(right: index < 5 ? fieldSpacing : 0),
                                      margin: EdgeInsets.all(2),
                                      child: TextFormField(
                                        autocorrect: false,
                                        autofocus: true,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                                        ],
                                        keyboardType: TextInputType.number,
                                        controller: otpControllerList[index],
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
                                          fontSize: 16,
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
                              30.heightBox,
                              CustomButton(
                                onPress: ()=> Get.toNamed(Routes.CREATE_lEDGER_EMPLOYEE_EKYC_PAGEVIEW),
                                borderRadius: 8,
                                height: 40,
                                width: 130,
                                text: 'Verify',
                                textColor: Colors.white,
                                backgroundColor: primaryColor,
                              )

                            ],
                          ),
                        ),
                      );
                    },
                  );
                },)),
              ],
            ),
          ),

          Visibility(
            visible: isManualKycSelected == true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                8.heightBox,
                CustomRichText(
                  text: 'Aadhar number',
                  textColor: primaryColor,
                  showAsterisk: true,
                ),
                6.heightBox,
                CustomFormField(
                    length: 12,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
                    inputType: TextInputType.number,
                    controller: aadharNumberController, label: 'Aadhar Number'),
                8.heightBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    14.heightBox,
                    CustomRichText(
                      text: 'Upload Aadhar card (Front and Back)',
                      textColor: primaryColor,
                      showAsterisk: true,
                    ),
                    6.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        profile.aadharFrontImage == null ?
                        'Not selected'
                            .text
                            .color(Colors.black.withOpacity(0.3))
                            .make()
                            : Image.file(
                          profile.aadharFrontImage!,
                          width: 100, // Set the width as needed
                          height: 100, // Set the height as needed
                        ),
                        profile.aadharBackImage == null
                            ? 'Not selected'
                            .text
                            .color(Colors.black.withOpacity(0.3))
                            .make()
                            : Image.file(
                          profile.aadharBackImage!,
                          width: 100,
                          height: 100,
                        ),

                        Column(
                          children: [
                            'Select Front'
                                .text
                                .size(8)
                                .white
                                .make()
                                .box
                                .color(primaryColor)
                                .p4
                                .make().onTap(() {
                                showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) =>
                                        CupertinoActionSheet(
                                          title: const Text(
                                              'Select Image Source'),
                                          actions: [
                                            CupertinoActionSheetAction(
                                              // ignore: duplicate_ignore
                                                onPressed: () async {
                                                  aadharBase64 =
                                                  await profile
                                                      .pickAadharFrontImage();

                                                  Navigator.pop(context);
                                                  if (aadharBase64 !=
                                                      null) {
                                                    setState(() {
                                                      isAadharUploaded =
                                                      false;
                                                    });
                                                  }
                                                },
                                                child: const Text(
                                                    'Gallery')),
                                            CupertinoActionSheetAction(
                                                onPressed: () async {
                                                  aadharBase64 =
                                                  await profile
                                                      .clickAadharFrontImage();
                                                  Navigator.pop(context);
                                                  if (aadharBase64 !=
                                                      null) {
                                                    setState(() {
                                                      isAadharUploaded =
                                                      false;
                                                    });
                                                  }
                                                },
                                                child:
                                                const Text('Camera'))
                                          ],
                                        ));

                            }),                              10.heightBox
                          ,'Select Back'
                                .text
                                .size(8)
                                .white
                                .make()
                                .box
                                .color(primaryColor)
                                .p4
                                .make().onTap(() {
                                showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) =>
                                        CupertinoActionSheet(
                                          title: const Text(
                                              'Select Image Source'),
                                          actions: [
                                            CupertinoActionSheetAction(
                                              // ignore: duplicate_ignore
                                                onPressed: () async {
                                                  aadharBase64 =
                                                  await profile
                                                      .pickAadharBackImage();

                                                  Navigator.pop(context);
                                                  if (aadharBase64 !=
                                                      null) {
                                                    setState(() {
                                                      isAadharUploaded =
                                                      false;
                                                    });
                                                  }
                                                },
                                                child: const Text(
                                                    'Gallery')),
                                            CupertinoActionSheetAction(
                                                onPressed: () async {
                                                  aadharBase64 =
                                                  await profile
                                                      .clickAadharBankImage();
                                                  Navigator.pop(context);
                                                  if (aadharBase64 !=
                                                      null) {
                                                    setState(() {
                                                      isAadharUploaded =
                                                      false;
                                                    });
                                                  }
                                                },
                                                child:
                                                const Text('Camera'))
                                          ],
                                        ));

                            }),
                          ],
                        ),
                      ],
                    )
                        .box
                        .withDecoration(BoxDecoration(
                      border: Border.all(
                        color: Colors.black.withOpacity(0.1),
                        // Set the border color to black
                        width: 1.0, // Set the border width
                      ),
                    ))
                        .padding(EdgeInsets.all(10))
                        .make(),
                    14.heightBox,
                    CustomRichText(
                      text: 'Pan Number',
                      textColor: primaryColor,
                      showAsterisk: true,
                    ),
                    6.heightBox,
                    CustomFormField(
                      length: 10,
                      textCapitalizationEnabled: true,
                      validator: true,
                      height: 16,
                      controller: createLedgerEmployeeController.panCardController,
                      label: 'Enter',
                    ),
                    8.heightBox,
                    CustomRichText(
                      text: 'Upload pan card',
                      textColor: primaryColor,
                      showAsterisk: true,
                    ),
                    6.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        profile.imageFile == null ?
                        'No file open'
                            .text
                            .color(Colors.black.withOpacity(0.3))
                            .make()
                            : Image.file(
                          profile.imageFile!,
                          width: 100, // Set the width as needed
                          height: 100, // Set the height as needed
                        ),

                        InkWell(
                          onTap: () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (context) =>
                                    CupertinoActionSheet(
                                      title: const Text(
                                          'Select Image Source'),
                                      actions: [
                                        CupertinoActionSheetAction(
                                          // ignore: duplicate_ignore
                                            onPressed: () async {
                                              panBase64 =
                                              await profile
                                                  .pickImage();

                                              Navigator.pop(context);
                                              if (panBase64 !=
                                                  null) {
                                                setState(() {
                                                  isPanUploaded =
                                                  false;
                                                });
                                              }
                                            },
                                            child: const Text(
                                                'Gallery')),
                                        CupertinoActionSheetAction(
                                            onPressed: () async {
                                              panBase64 =
                                              await profile
                                                  .clickImage();
                                              Navigator.pop(context);
                                              if (panBase64 !=
                                                  null) {
                                                setState(() {
                                                  isPanUploaded =
                                                  false;
                                                });
                                              }
                                            },
                                            child:
                                            const Text('Camera'))
                                      ],
                                    ));
                          },

                          child: 'Choose File'
                              .text
                              .size(12)
                              .white
                              .make()
                              .box
                              .color(primaryColor)
                              .p4
                              .make(),
                        ),
                      ],
                    )
                        .box
                        .withDecoration(BoxDecoration(
                      border: Border.all(
                        color: Colors.black.withOpacity(0.1),
                        // Set the border color to black
                        width: 1.0, // Set the border width
                      ),
                    ))
                        .padding(EdgeInsets.all(10))
                        .make(),

                    8.heightBox,
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        width: 80,
                        child: TextButton(
                            onPressed: ()=> Get.toNamed(Routes.CREATE_lEDGER_EMPLOYEE_MANUAL_KYC_PAGEVIEW),
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
                )
              ],
            ),
          ),
        ],
      ).p16(),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/constants/app_lists.dart';
import 'package:hpn_pay_project_avestan/constants/app_strings.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_appbar.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_button.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_checkbox.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_dropdown.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_text_asteric.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_textformfield.dart';
import 'package:hpn_pay_project_avestan/routes/app_pages.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create/create_ledger/agent/company_agent_controller.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create/create_ledger/company_create_ledger_controller.dart';
import 'package:hpn_pay_project_avestan/services/image_services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../data_classes/add_amount_field.dart';

class CreateLedgerAgentEkycPageView extends StatefulWidget {
  CreateLedgerAgentEkycPageView({Key? key}) : super(key: key);

  @override
  State<CreateLedgerAgentEkycPageView> createState() =>
      _CreateLedgerAgentEkycPageViewState();
}

class _CreateLedgerAgentEkycPageViewState
    extends State<CreateLedgerAgentEkycPageView> {
  var createLedgerAgentController = Get.put(CompanyAgentController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();
  DateTime selectedJoiningDate = DateTime.now();

  ImageSelector profile = ImageSelector();
  String? profileBase64 = '';
  bool isProfileUploaded = false;

  bool? isUpgradePlanYesSelected = false;
  bool? isUpgradePlanNoSelected = false;

  String dropdownPaymentMethod = 'Select';

  // Selected value
  List<String> paymentMethodTypes = [
    'Select',
    'Payment in flat',
    'Payment in percentage',
  ];
  void onUpgradePlanChangedYes(bool? newValue) {
    setState(() {
      isUpgradePlanYesSelected = newValue;
      isUpgradePlanNoSelected = !newValue!; // Deselect "No" when "Yes" is selected
    });
  }

  void onUpgradePlanChangedNo(bool? newValue) {
    setState(() {
      isUpgradePlanNoSelected = newValue;
      isUpgradePlanYesSelected = !newValue!; // Deselect "Yes" when "No" is selected
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: whiteColor,
      key: _scaffoldKey,
      appBar: CustomAppBar(
        onBackTap: Get.back,
        leading: Icon(Icons.arrow_back_ios, color: blackColor, size: 20).px4(),
        backgroundColor: whiteColor,
      ),
      body: Form(
        key: createLedgerAgentController.formKey,
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: createLedgerAgentController.pageController,
          children: [
            firstFormPage(0),
            secondFormPage(1),
            thirdFormPage(2),
            fourthFormPage(3),
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
          6.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRichText(
                    text: 'Party Name',
                    textColor: primaryColor,
                    showAsterisk: true,
                  ),
                  6.heightBox,
                  SizedBox(
                    width: 200,
                    child: CustomFormField(
                      readOnly: true,
                      height: 16,
                      controller:
                          createLedgerAgentController.partyNameController,
                      label: 'Party name',
                    ),
                  ),
                  8.heightBox,
                  CustomRichText(
                    text: 'Display Name',
                    textColor: primaryColor,
                    showAsterisk: true,
                  ),
                  6.heightBox,
                  SizedBox(
                    width: 200,
                    child: CustomFormField(
                      readOnly: true,
                      height: 16,
                      controller:
                          createLedgerAgentController.displayNameController,
                      label: 'Display name',
                    ),
                  ),
                ],
              ),
              Image.asset(
                'assets/images/viewprofile.png',
              ).box.height(153).width(116).make()
            ],
          ),
          8.heightBox,
          CustomRichText(
            text: 'Address',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            readOnly: true,
            height: 16,
            controller: createLedgerAgentController.addressController,
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
            readOnly: true,
            height: 16,
            controller: createLedgerAgentController.stateController,
            label: 'State',
          ),
          8.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRichText(
                    text: 'City',
                    textColor: primaryColor,
                    showAsterisk: true,
                  ),
                  6.heightBox,
                  SizedBox(
                    width: 153,
                    child: CustomFormField(
                      readOnly: true,
                      height: 16,
                      controller: createLedgerAgentController.cityController,
                      label: 'City',
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRichText(
                    text: 'Pincode',
                    textColor: primaryColor,
                    showAsterisk: true,
                  ),
                  6.heightBox,
                  SizedBox(
                    width: 153,
                    child: CustomFormField(
                      readOnly: true,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      // Pass it as a list
                      inputType: TextInputType.number,
                      height: 16,
                      controller:
                          createLedgerAgentController.pinCodeController,
                      label: 'Pincode',
                    ),
                  ),
                ],
              ),
            ],
          ),
          8.heightBox,
          CustomRichText(
            text: 'Email Address',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            height: 16,
            controller: createLedgerAgentController.emailAddressController,
            label: 'Enter',
          ),
          8.heightBox,
          CustomRichText(
            text: 'Mobile number',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            // Pass it as a list
            inputType: TextInputType.number,
            height: 16,
            controller: createLedgerAgentController.mobileNumberController,
            label: 'Enter',
          ),
          8.heightBox,
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 80,
              child: TextButton(
                  onPressed: () {
                    // if (createLedgerAgentController.formKey.currentState!
                    //     .validate()) {
                    if (page < 1) {
                      createLedgerAgentController.pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    } else {
                      // Handle form submission or navigation to the next screen
                      // based on your app logic.
                    }
                    // }
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
            text: 'Gender',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomDropdown(
            hintText: 'Select',
            value: dropdownValueGender,
            items: genderList,
            onChanged: (String? val) {
              setState(() {
                dropdownValueGender = val ?? 'Select';
              });
            },
          ),
          8.heightBox,
          CustomRichText(
            text: 'Date of Birth',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          GestureDetector(
            onTap: () {
              _selectDate(context); // Call the _selectDate function on tap
            },
            child: Text("${selectedDate.toLocal()}".split(' ')[0]),
          )
              .box
              .width(double.infinity)
              .height(50)
              .withDecoration(
                BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withOpacity(0.1),
                    width: 1.0,
                  ),
                ),
              )
              .padding(EdgeInsets.all(10))
              .make(),
          8.heightBox,
          CustomRichText(
            text: 'Pan Card Number',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            textCapitalizationEnabled: true,
            isPanCard: true,
            height: 16,
            controller: createLedgerAgentController.panCardController,
            label: 'Pan Number',
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
              profile.imageFile == null
                  ? 'No file open'
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
                      builder: (context) => CupertinoActionSheet(
                            title: const Text('Select Image Source'),
                            actions: [
                              CupertinoActionSheetAction(
                                  // ignore: duplicate_ignore
                                  onPressed: () async {
                                    profileBase64 = await profile.pickImage();

                                    Navigator.pop(context);
                                    if (profileBase64 != null) {
                                      setState(() {
                                        isProfileUploaded = false;
                                      });
                                    }
                                  },
                                  child: const Text('Gallery')),
                              CupertinoActionSheetAction(
                                  onPressed: () async {
                                    profileBase64 = await profile.clickImage();
                                    Navigator.pop(context);
                                    if (profileBase64 != null) {
                                      setState(() {
                                        isProfileUploaded = false;
                                      });
                                    }
                                  },
                                  child: const Text('Camera'))
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
          10.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 80,
                child: TextButton(
                    onPressed: () {
                      if (page > 0) {
                        createLedgerAgentController.pageController
                            .previousPage(
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
              SizedBox(
                width: 60,
                child: TextButton(
                    onPressed: () {
                      if (page > 0) {
                        createLedgerAgentController.pageController.nextPage(
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
                        'Next'.text.black.size(12).make(),
                        3.widthBox,
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 12,
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ],
      ).p16(),
    );
  }

  Widget thirdFormPage(int page) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          'Bank details'.text.black.semiBold.size(18).make(),
          10.heightBox,
          CustomRichText(
            text: 'Bank Name',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomDropdown(
            hintText: 'Select',
            value: dropdownValueBank,
            items: banksList,
            onChanged: (String? val) {
              setState(() {
                dropdownValueBank = val ?? 'Select';
              });
            },
          ),
          8.heightBox,
          CustomRichText(
            text: 'Bank Holder Name',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            height: 16,
            controller: createLedgerAgentController.bankHolderNameController,
            label: 'Enter',
          ),
          8.heightBox,
          CustomRichText(
            text: 'Account number',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
            inputType: TextInputType.number,

            height: 16,
            controller: createLedgerAgentController.accountNumberController,
            label: 'Enter',
          ),
          8.heightBox,
          CustomRichText(
            text: 'IFSC Code',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            textCapitalizationEnabled: true,
            height: 16,
            controller: createLedgerAgentController.ifscCodeController,
            label: 'Enter',
          ),
          8.heightBox,
          CustomRichText(
            text: 'Joining Date',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,

          GestureDetector(
            onTap: () {
              _selectJoiningDate(context); // Call the _selectDate function on tap
            },
            child: Text("${selectedJoiningDate.toLocal()}".split(' ')[0]),
          )
              .box
              .width(double.infinity)
              .height(50)
              .withDecoration(
            BoxDecoration(
              border: Border.all(
                color: Colors.black.withOpacity(0.1),
                width: 1.0,
              ),
            ),
          )
              .padding(EdgeInsets.all(10))
              .make(),
          10.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 80,
                child: TextButton(
                    onPressed: () {
                      if (page > 0) {
                        createLedgerAgentController.pageController
                            .previousPage(
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
              SizedBox(
                width: 60,
                child: TextButton(
                    onPressed: () {
                      if (page > 0) {
                        createLedgerAgentController.pageController.nextPage(
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
                        'Next'.text.black.size(12).make(),
                        3.widthBox,
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 12,
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ],
      ).p16(),
    );
  }

  Widget fourthFormPage(int page) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          'Commission'.text.black.semiBold.size(18).make(),
          10.heightBox,
          CustomRichText(
            text: 'Type of Loan',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomDropdown(
            hintText: 'Enter',
            value: dropdownValueLoanType,
            items: loanTypeList,
            onChanged: (String? val) {
              setState(() {
                dropdownValueLoanType = val ?? 'Enter';
              });
            },
          ),
          8.heightBox,
          CustomRichText(
            text: 'Range',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRichText(
                    text: 'From',
                    textColor: primaryColor,
                    showAsterisk: false,
                  ),
                  2.heightBox,
                  SizedBox(
                    width: 153,
                    child: CustomFormField(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
                      inputType: TextInputType.number,
                      height: 16,
                      controller:
                      createLedgerAgentController.rangeFromController,
                      label: 'Amount in Lakh',
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRichText(
                    text: 'To',
                    textColor: primaryColor,
                    showAsterisk: false,
                  ),
                  2.heightBox,
                  SizedBox(
                    width: 153,
                    child: CustomFormField(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
                      inputType: TextInputType.number,
                      height: 16,
                      controller:createLedgerAgentController.rangeToController,

                      label: 'Amount in Lakh',
                    ),
                  ),
                ],
              ),
            ],
          ),
          8.heightBox,
          CustomRichText(
            text: 'Method of Payment',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomDropdown(
            hintText: 'Select',
            value: dropdownPaymentMethod,
            items: paymentMethodTypes,
            onChanged: (String? val) {
              setState(() {
                dropdownPaymentMethod = val ?? 'Select';
              });
            },
          ),

          8.heightBox,
          CustomRichText(
            text: 'Amount',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
            inputType: TextInputType.number,
            height: 16,
            controller:
            createLedgerAgentController.amountIncentiveController,
            label: 'Enter',
          ),
          8.heightBox,
          CustomRichText(
            text: 'Additional',
            textColor: primaryColor,
          ),
          6.heightBox,
          CustomDropdown(
            hintText: 'Select',
            value: dropdownValueAdditional,
            items: additionalList,
            onChanged: (String? val) {
              setState(() {
                dropdownValueAdditional = val ?? 'Select';
                if (val == 'Add more range') {
                  addMoreRangeField();
                }
                if (val == 'Add more Loan') {
                  addMoreLoanField();
                }
              });
            },
          ),

          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: createLedgerAgentController.rangeList.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRichText(
                    text: 'Range',
                    textColor: primaryColor,
                    showAsterisk: true,
                  ),
                  6.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomRichText(
                            text: 'From',
                            textColor: primaryColor,
                            showAsterisk: false,
                          ),
                          2.heightBox,
                          SizedBox(
                            width: 153,
                            child: CustomFormField(
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
                              inputType: TextInputType.number,
                              height: 16,
                              controller:
                              createLedgerAgentController.rangeFromController,
                              label: 'Amount in Lakh',
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomRichText(
                            text: 'To',
                            textColor: primaryColor,
                            showAsterisk: false,
                          ),
                          2.heightBox,
                          SizedBox(
                            width: 153,
                            child: CustomFormField(
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
                              inputType: TextInputType.number,
                              height: 16,
                              controller:createLedgerAgentController.rangeToController,

                              label: 'Amount in Lakh',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  8.heightBox,
                  CustomRichText(
                    text: 'Amount',
                    textColor: primaryColor,
                  ),
                  6.heightBox,
                  CustomFormField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    // Pass it as a list
                    inputType: TextInputType.number,
                    height: 16,
                    controller: createLedgerAgentController
                        .rangeList[index].rangeListController,
                    label: 'Amount',
                  ),
                ],
              );
            },
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: createLedgerAgentController.loanList.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  8.heightBox,
                  CustomRichText(
                    text: 'Type of Loan',
                    textColor: primaryColor,
                    showAsterisk: true,
                  ),
                  6.heightBox,
                  CustomDropdown(
                    hintText: 'Enter',
                    value: dropdownValueLoanType,
                    items: loanTypeList,
                    onChanged: (String? val) {
                      setState(() {
                        dropdownValueLoanType = val ?? 'Enter';
                      });
                    },
                  ),
                  8.heightBox,
                  CustomRichText(
                    text: 'Amount',
                    textColor: primaryColor,
                  ),
                  6.heightBox,
                  CustomFormField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    // Pass it as a list
                    inputType: TextInputType.number,
                    height: 16,
                    controller: createLedgerAgentController
                        .loanList[index].loanListController,
                    label: 'Amount',
                  ),
                ],
              );
            },
          ),

          10.heightBox,
          8.heightBox,
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: "(If Agent continues with the target in the given months then they will be promote for next level of if they will not continues with the target then they will be promote down)".text.makeCentered(),
            ),
          ),

          20.heightBox,
          CustomRichText(
            text: 'Upgrade Plan',
            textColor: primaryColor,
            showAsterisk: false,
          ),
          10.heightBox,
          Row(
            children: [
              CustomCheckbox(
                label: 'Yes',
                value: isUpgradePlanYesSelected,
                onChanged: onUpgradePlanChangedYes,
                borderRadius: BorderRadius.circular(50),
              ),
              CustomCheckbox(
                label: 'No',
                value: isUpgradePlanNoSelected,
                onChanged: onUpgradePlanChangedNo,
                borderRadius: BorderRadius.circular(50),
              ),

            ],
          ),
          10.heightBox,
          SizedBox(
            width: 80,
            child: TextButton(
                onPressed: () {
                  if (page > 0) {
                    createLedgerAgentController.pageController
                        .previousPage(
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

          20.heightBox,
          Obx(() {
            return Align(
              alignment: Alignment.center,
              child: CustomButton(
                isLoading: createLedgerAgentController.isButtonLoad.value,
                onPress: () {
                  if (createLedgerAgentController.pageController.page != 0) {
                    // Navigate to page 0
                    Get.toNamed(Routes.COMPANY_CREATE_LEDGER_DASHBOARD);
                    createLedgerAgentController.pageController.animateToPage(
                      0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  } else {
                    // Handle form submission or navigation to the next screen
                    // based on your app logic.
                  }
                },
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

  // Function to open the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  // Function to open the date picker
  Future<void> _selectJoiningDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedJoiningDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedJoiningDate) {
      setState(() {
        selectedJoiningDate = picked;
      });
    }
  }

  void addMoreRangeField() {
    createLedgerAgentController.rangeList.add(RangeData( rangeListController: TextEditingController(),
    ));
    setState(() {});
  }
  void addMoreLoanField() {
    createLedgerAgentController.loanList.add(LoanData( loanListController: TextEditingController(),
    ));
    setState(() {});
  }

}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_appbar.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_button.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_checkbox.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_dropdown.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_text_asteric.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_textformfield.dart';
import 'package:hpn_pay_project_avestan/routes/app_pages.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create/create_ledger/company_create_ledger_controller.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create/create_ledger/distributor/company_distributor_controller.dart';
import 'package:hpn_pay_project_avestan/services/image_services.dart';
import 'package:velocity_x/velocity_x.dart';

class CreateLedgerDistributorEkycPageView extends StatefulWidget {
  CreateLedgerDistributorEkycPageView({Key? key}) : super(key: key);

  @override
  State<CreateLedgerDistributorEkycPageView> createState() =>
      _CreateLedgerDistributorEkycPageViewState();
}

class _CreateLedgerDistributorEkycPageViewState
    extends State<CreateLedgerDistributorEkycPageView> {
  var createLedgerDistributorController = Get.put(CompanyDistributorController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();

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
  String dropdownValueLoanType = 'Select';
  String dropdownValuePaymentMethod = 'Select';
  String dropdownValueAdditional = 'Select';

  List<String> loanTypeList = [
    'Select',
    'Personal Loan',
    'Property Loan',
    'Home Loan',
    'Personal Loan',
  ];
  List<String> paymentMethodList = [
    'Select',
    'Payment in flat',
    'Payment in percentage',
  ];
  List<String> additionalList = [
    'Select',
    'Add more range',
    'Add more Loan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      key: _scaffoldKey,
      appBar: CustomAppBar(
        onBackTap: Get.back,
        leading: Icon(Icons.arrow_back_ios, color: blackColor, size: 20).px4(),
        backgroundColor: whiteColor,
      ),
      body: Form(
        key: createLedgerDistributorController.formKey,
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: createLedgerDistributorController.pageController,
          children: [
            firstFormPage(0),
            secondFormPage(1),
            thirdFormPage(2),
            fourthFormPage(3),
            fifthFormPage(4),
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
                          createLedgerDistributorController.partyNameController,
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
                          createLedgerDistributorController.displayNameController,
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
            controller: createLedgerDistributorController.addressController,
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
            controller: createLedgerDistributorController.stateController,
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
                      controller: createLedgerDistributorController.cityController,
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
                          createLedgerDistributorController.pinCodeController,
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
            readOnly: true,
            height: 16,
            controller: createLedgerDistributorController.emailAddressController,
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
            readOnly: true,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            // Pass it as a list
            inputType: TextInputType.number,
            height: 16,
            controller: createLedgerDistributorController.mobileNumberController,
            label: 'Enter',
          ),
          8.heightBox,
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 80,
              child: TextButton(
                  onPressed: () {
                    // if (createLedgerDistributorController.formKey.currentState!
                    //     .validate()) {
                    if (page < 1) {
                      createLedgerDistributorController.pageController.nextPage(
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
          CustomFormField(
            height: 16,
            controller: createLedgerDistributorController.genderController,
            label: 'Enter',
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
            height: 16,
            controller: createLedgerDistributorController.panCardController,
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
                  : Text(
                      profile.imageFile == null
                          ? 'No file open'
                          : profile.imageFile!.path.split('/').last,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.3),
                      ),
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
                        createLedgerDistributorController.pageController
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
                        createLedgerDistributorController.pageController.nextPage(
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
          CustomFormField(
            height: 16,
            controller: createLedgerDistributorController.bankNameController,
            label: 'Enter',
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
            controller: createLedgerDistributorController.bankHolderNameController,
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
            height: 16,
            controller: createLedgerDistributorController.accountNumberController,
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
            height: 16,
            controller: createLedgerDistributorController.ifscCodeController,
            label: 'Enter',
          ),
          8.heightBox,
          CustomRichText(
            text: 'Starting Date',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            height: 16,
            controller: createLedgerDistributorController.joiningDateController,
            label: 'By default',
          ),
          10.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 80,
                child: TextButton(
                    onPressed: () {
                      if (page > 0) {
                        createLedgerDistributorController.pageController
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
                        createLedgerDistributorController.pageController.nextPage(
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
          'Target'.text.black.semiBold.size(18).make(),
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
            text: 'Minimum Business',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          CustomFormField(
            height: 16,
            controller: createLedgerDistributorController.minimumFileController,
            label: 'Enter',
          ),
          8.heightBox,
          CustomRichText(
            text: 'Minimum Payout',
            textColor: primaryColor,
            showAsterisk: true,
          ),
          6.heightBox,
          Row(
            children: [
              SizedBox(
                width: 170,
                child: CustomFormField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
                  inputType: TextInputType.number,
                  height: 16,
                  controller:
                  createLedgerDistributorController.continuePerformanceController,
                  label: 'Enter',
                ),
              ),
              10.widthBox,
              'Per month'.text.color(primaryColor).make()
            ],
          ),
          10.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 80,
                child: TextButton(
                    onPressed: () {
                      if (page > 0) {
                        createLedgerDistributorController.pageController
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
                        createLedgerDistributorController.pageController.nextPage(
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

  Widget fifthFormPage(int page) {
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
                      createLedgerDistributorController.rangeFromController,
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
                      controller:createLedgerDistributorController.rangeToController,

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
            createLedgerDistributorController.amountIncentiveController,
            label: 'Enter',
          ),
          8.heightBox,
          CustomRichText(
            text: 'Additional',
            textColor: primaryColor,
          ),
          6.heightBox,
          CustomDropdown(
            hintText: 'Enter',
            value: dropdownValueAdditional,
            items: additionalList,
            onChanged: (String? val) {
              setState(() {
                dropdownValueAdditional = val ?? 'Enter';
              });
            },
          ),
          10.heightBox,
          8.heightBox,
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: "(If Distributor continues with the target in the given months then they will be promote for next level of if they will not continues with the target then they will be promote down)".text.makeCentered(),
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
                    createLedgerDistributorController.pageController
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
                isLoading: createLedgerDistributorController.isButtonLoad.value,
                onPress: () {
                  if (createLedgerDistributorController.pageController.page != 0) {
                    // Navigate to page 0
                    Get.toNamed(Routes.COMPANY_CREATE_LEDGER_DASHBOARD);
                    createLedgerDistributorController.pageController.animateToPage(
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

}

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
import 'package:hpn_pay_project_avestan/screens/company_dashboard/company_dashboard_controller.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create/data_classes/add_amount_field.dart';
import 'package:hpn_pay_project_avestan/services/image_services.dart';
import 'package:velocity_x/velocity_x.dart';

class CompanyCreateLedgerPartyBankPage extends StatefulWidget {
  CompanyCreateLedgerPartyBankPage({super.key});

  @override
  State<CompanyCreateLedgerPartyBankPage> createState() =>
      _CompanyCreateLedgerPartyBankPageState();
}

class _CompanyCreateLedgerPartyBankPageState extends State<CompanyCreateLedgerPartyBankPage> {
  var ledgerPageController = Get.put(CompanyDashboardController());
  DateTime selectedDate = DateTime.now();

  ImageSelector profile = ImageSelector();
  String? profileBase64 = '';
  bool isProfileUploaded = false;


  bool? isGstYesSelected = false;
  bool? isGstNoSelected = false;


  void onChangedGstYes(bool? newValue) {
    setState(() {
      isGstYesSelected = newValue;
      isGstNoSelected = !newValue!; // Deselect "No" when "Yes" is selected
    });
  }

  void onChangedGstNo(bool? newValue) {
    setState(() {
      isGstNoSelected = newValue;
      isGstYesSelected = !newValue!; // Deselect "Yes" when "No" is selected
    });
  }


  bool? isUpgradePlanYesSelected = false;
  bool? isUpgradePlanNoSelected = false;

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
        backgroundColor: whiteColor,
        appBar: CustomAppBar(
          onBackTap: Get.back,
          leading: Icon(Icons.arrow_back_ios, color: blackColor, size: 20),
          backgroundColor: whiteColor,
          // child: 'nsfsdf'.text.black.make(),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomRichText(
                text: 'Party Name',
                textColor: primaryColor,
                showAsterisk: true,
              ),
              6.heightBox,
              CustomFormField(
                height: 16,
                controller: ledgerPageController.partyNameController,
                label: 'Party name',
              ),
              8.heightBox,
              CustomRichText(
                text: 'Display Name',
                textColor: primaryColor,
                showAsterisk: true,
              ),
              6.heightBox,
              CustomFormField(
                height: 16,
                controller: ledgerPageController.displayNameController,
                label: 'Display name',
              ),
              8.heightBox,
              CustomRichText(
                text: 'Upload Cover image',
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
                                        profileBase64 =
                                        await profile
                                            .pickImage();

                                        Navigator.pop(context);
                                        if (profileBase64 !=
                                            null) {
                                          setState(() {
                                            isProfileUploaded =
                                            false;
                                          });
                                        }
                                      },
                                      child: const Text(
                                          'Gallery')),
                                  CupertinoActionSheetAction(
                                      onPressed: () async {
                                        profileBase64 =
                                        await profile
                                            .clickImage();
                                        Navigator.pop(context);
                                        if (profileBase64 !=
                                            null) {
                                          setState(() {
                                            isProfileUploaded =
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
              CustomRichText(
                text: 'Address',
                textColor: primaryColor,
                showAsterisk: true,
              ),
              6.heightBox,
              CustomFormField(
                height: 16,
                controller: ledgerPageController.addressController,
                label: 'Address',
              ),
              8.heightBox,
              CustomRichText(
                text: 'State',
                textColor: primaryColor,
                showAsterisk: true,
              ),
              6.heightBox,
              CustomDropdown(
                hintText: 'Select State',
                value: dropdownValueState,
                items: state,
                onChanged: (String? val) {
                  setState(() {
                    dropdownValueState = val ?? 'Select State';
                  });
                },
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
                        child: CustomDropdown(
                          hintText: 'Select City',
                          value: dropdownValueCity,
                          items: city,
                          onChanged: (String? val) {
                            setState(() {
                              dropdownValueCity = val ?? 'Select City';
                            });
                          },
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
                          length: 6,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
                          inputType: TextInputType.number,
                          height: 16,
                          controller: ledgerPageController.pinCodeController,
                          label: 'Pincode',
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              8.heightBox,
              CustomRichText(
                text: 'Mobile number',
                textColor: primaryColor,
                showAsterisk: true,
              ),
              6.heightBox,
              CustomFormField(
                length: 10,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
                inputType: TextInputType.number,
                height: 16,
                controller: ledgerPageController.mobileNumberController,
                label: 'Enter',
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
                controller: ledgerPageController.emailAddressController,
                label: 'Enter',
              ),
              8.heightBox,
              CustomRichText(
                text: 'GST Number',
                textColor: primaryColor,
                showAsterisk: true,
              ),
              10.heightBox,
              Row(
                children: [
                  CustomCheckbox(
                    label: 'Yes',
                    value: isGstYesSelected,
                    onChanged: onChangedGstYes,
                    activeColor: Colors.green,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  CustomCheckbox(
                    label: 'No',
                    value: isGstNoSelected,
                    onChanged: onChangedGstNo,
                    activeColor: Colors.green,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ],
              ),
              Visibility(
                  visible: isGstYesSelected == true,
                  child: CustomFormField(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
                      inputType: TextInputType.number,
                      controller: ledgerPageController.gstNumberController,
                      label: 'GST Number')),
              8.heightBox,
              CustomRichText(
                text: 'Effective Date',
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
                text: 'Update URL',
                textColor: primaryColor,
                showAsterisk: true,
              ),
              6.heightBox,
              CustomFormField(
                height: 16,
                controller: ledgerPageController.updateUrlController,
                label: 'Enter',
              ),
              8.heightBox,
              8.heightBox,
              CustomRichText(
                text: 'User ID',
                textColor: primaryColor,
                showAsterisk: true,
              ),
              6.heightBox,
              CustomFormField(
                height: 16,
                controller: ledgerPageController.userIdController,
                label: 'Enter',
              ),
              8.heightBox,
              CustomRichText(
                toolTipMessage: 'Your password should be - 1 aphabetic letter 1 capital letter 1 numeric value 1 special character password limit 8 - 15 digits',
                text: 'Password',
                textColor: primaryColor,
                showAsterisk: true,
              ),

              6.heightBox,
              CustomFormField(
                length: 15,
                height: 16,
                controller: ledgerPageController.passwordController,
                label: 'Enter',
                customValidator: validatePassword,
              ),
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
                              ledgerPageController.loanRangeFromController,
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
                          controller:
                              ledgerPageController.loanRangeToController,
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
                value: dropdownValuePaymentMethod,
                items: paymentMethodList,
                onChanged: (String? val) {
                  setState(() {
                    dropdownValuePaymentMethod = val ?? 'Select';
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
                controller: ledgerPageController.amountController,
                label: 'Enter',
              ),
              8.heightBox,
              CustomRichText(
                text: 'Additional',
                textColor: primaryColor,
                showAsterisk: false,
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
                itemCount: ledgerPageController.rangeList.length,
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
                                  ledgerPageController.loanRangeFromController,
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
                                  controller:ledgerPageController.loanRangeToController,

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
                        controller: ledgerPageController
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
                itemCount: ledgerPageController.loanList.length,
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
                        controller: ledgerPageController
                            .loanList[index].loanListController,
                        label: 'Amount',
                      ),
                    ],
                  );
                },
              ),


              8.heightBox,
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
                    activeColor: Colors.green,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  CustomCheckbox(
                    label: 'No',
                    value: isUpgradePlanNoSelected,
                    onChanged: onUpgradePlanChangedNo,
                    activeColor: Colors.green,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ],
              ),
              // Visibility(
              //   visible: isUpgradePlanYesSelected == true,
              //   child: Column(
              //     children: [
              //       8.heightBox,
              //       CustomRichText(
              //         text: 'Effective Date',
              //         textColor: primaryColor,
              //         showAsterisk: true,
              //       ),
              //       6.heightBox,
              //       GestureDetector(
              //         onTap: () {
              //           _selectDate(context); // Call the _selectDate function on tap
              //         },
              //         child: Text("${selectedDate.toLocal()}".split(' ')[0]),
              //       )
              //           .box
              //           .width(double.infinity)
              //           .height(50)
              //           .withDecoration(
              //         BoxDecoration(
              //           border: Border.all(
              //             color: Colors.black.withOpacity(0.1),
              //             width: 1.0,
              //           ),
              //         ),
              //       )
              //           .padding(EdgeInsets.all(10))
              //           .make(),
              //       8.heightBox,
              //       CustomRichText(
              //         text: 'Update URL',
              //         textColor: primaryColor,
              //         showAsterisk: true,
              //       ),
              //       6.heightBox,
              //       CustomFormField(
              //         height: 16,
              //         controller: ledgerPageController.updateUrlController,
              //         label: 'Enter',
              //       ),
              //       8.heightBox,
              //       8.heightBox,
              //       CustomRichText(
              //         text: 'User ID',
              //         textColor: primaryColor,
              //         showAsterisk: true,
              //       ),
              //       6.heightBox,
              //       CustomFormField(
              //         height: 16,
              //         controller: ledgerPageController.userIdController,
              //         label: 'Enter',
              //       ),
              //       8.heightBox,
              //       CustomRichText(
              //         toolTipMessage: 'Your password should be - 1 aphabetic letter 1 capital letter 1 numeric value 1 special character password limit 8 - 15 digits',
              //         text: 'Password',
              //         textColor: primaryColor,
              //         showAsterisk: true,
              //       ),
              //
              //       6.heightBox,
              //       CustomFormField(
              //         length: 15,
              //         height: 16,
              //         controller: ledgerPageController.passwordController,
              //         label: 'Enter',
              //         customValidator: validatePassword,
              //       ),
              //       8.heightBox,
              //       CustomRichText(
              //         text: 'Type of Loan',
              //         textColor: primaryColor,
              //         showAsterisk: true,
              //       ),
              //       6.heightBox,
              //       CustomDropdown(
              //         hintText: 'Enter',
              //         value: dropdownValueLoanType,
              //         items: loanTypeList,
              //         onChanged: (String? val) {
              //           setState(() {
              //             dropdownValueLoanType = val ?? 'Enter';
              //           });
              //         },
              //       ),
              //       8.heightBox,
              //       CustomRichText(
              //         text: 'Range',
              //         textColor: primaryColor,
              //         showAsterisk: true,
              //       ),
              //       6.heightBox,
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Column(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               CustomRichText(
              //                 text: 'From',
              //                 textColor: primaryColor,
              //                 showAsterisk: false,
              //               ),
              //               2.heightBox,
              //               SizedBox(
              //                 width: 153,
              //                 child: CustomFormField(
              //                   inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
              //                   inputType: TextInputType.number,
              //                   height: 16,
              //                   controller:
              //                   ledgerPageController.loanRangeFromController,
              //                   label: 'Amount in Lakh',
              //                 ),
              //               ),
              //             ],
              //           ),
              //           Column(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               CustomRichText(
              //                 text: 'To',
              //                 textColor: primaryColor,
              //                 showAsterisk: false,
              //               ),
              //               2.heightBox,
              //               SizedBox(
              //                 width: 153,
              //                 child: CustomFormField(
              //                   inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
              //                   inputType: TextInputType.number,
              //                   height: 16,
              //                   controller:
              //                   ledgerPageController.loanRangeToController,
              //                   label: 'Amount in Lakh',
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //       8.heightBox,
              //       CustomRichText(
              //         text: 'Method of Payment',
              //         textColor: primaryColor,
              //         showAsterisk: true,
              //       ),
              //       6.heightBox,
              //       CustomDropdown(
              //         hintText: 'Select',
              //         value: dropdownValuePaymentMethod,
              //         items: paymentMethodList,
              //         onChanged: (String? val) {
              //           setState(() {
              //             dropdownValuePaymentMethod = val ?? 'Select';
              //           });
              //         },
              //       ),
              //
              //       8.heightBox,
              //       CustomRichText(
              //         text: 'Amount',
              //         textColor: primaryColor,
              //         showAsterisk: true,
              //       ),
              //       6.heightBox,
              //       CustomFormField(
              //         inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
              //         inputType: TextInputType.number,
              //         height: 16,
              //         controller: ledgerPageController.amountController,
              //         label: 'Enter',
              //       ),
              //       8.heightBox,
              //       CustomRichText(
              //         text: 'Additional',
              //         textColor: primaryColor,
              //         showAsterisk: false,
              //       ),
              //       6.heightBox,
              //       CustomDropdown(
              //         hintText: 'Select',
              //         value: dropdownValueAdditional,
              //         items: additionalList,
              //         onChanged: (String? val) {
              //           setState(() {
              //             dropdownValueAdditional = val ?? 'Select';
              //             if (val == 'Add more range' || val == 'Add more Loan') {
              //               addAmountField();
              //             }
              //           });
              //         },
              //       ),
              //       ListView.builder(
              //         physics: NeverScrollableScrollPhysics(),
              //         shrinkWrap: true,
              //         itemCount: ledgerPageController.amountUpgradePlanList.length,
              //         itemBuilder: (context, index) {
              //           return Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               8.heightBox,
              //               CustomRichText(
              //                 text: 'Amount',
              //                 textColor: primaryColor,
              //               ),
              //               6.heightBox,
              //               CustomFormField(
              //                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              //                 // Pass it as a list
              //                 inputType: TextInputType.number,
              //                 height: 16,
              //                 controller: ledgerPageController
              //                     .amountUpgradePlanList[index].amountListController,
              //                 label: 'Amount',
              //               ),
              //             ],
              //           );
              //         },
              //       ),
              //
              //
              //     ],
              //   ),
              // ),
              20.heightBox,
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  onPress: ()=> Get.toNamed(Routes.COMPANY_CREATE_LEDGER_DASHBOARD),
                  backgroundColor: primaryColor,
                  textColor: whiteColor,
                  text: 'Submit',
                  height: 50,
                  width: 240,
                  borderRadius: 24,
                ),
              )
            ],
          ).p16(),
        ));
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

  void addMoreRangeField() {
    ledgerPageController.rangeList.add(RangeData( rangeListController: TextEditingController(),
    ));
    setState(() {});
  }
  void addMoreLoanField() {
    ledgerPageController.loanList.add(LoanData( loanListController: TextEditingController(),
    ));
    setState(() {});
  }
  String? validatePassword(String value) {
    // Define a regular expression pattern for password validation
    String pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$';
    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) {
      return 'Please enter a password';
    } else if (!regExp.hasMatch(value)) {
      return 'Password must contain at least one lowercase letter, one uppercase letter, one numeric digit, one special character, and be 8-15 characters long.';
    }

    return null; // Return null for a valid input
  }


}

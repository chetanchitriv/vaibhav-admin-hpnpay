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
import 'package:hpn_pay_project_avestan/screens/company_dashboard/company_dashboard_controller.dart';
import 'package:hpn_pay_project_avestan/services/image_services.dart';
import 'package:velocity_x/velocity_x.dart';

class CompanyCreateLedgerPage extends StatefulWidget {
  CompanyCreateLedgerPage({super.key});

  @override
  State<CompanyCreateLedgerPage> createState() =>
      _CompanyCreateLedgerPageState();
}

class _CompanyCreateLedgerPageState extends State<CompanyCreateLedgerPage> {
  var ledgerPageController = Get.put(CompanyDashboardController());
  DateTime selectedDate = DateTime.now();

  ImageSelector profile = ImageSelector();
  String? profileBase64 = '';
  bool isProfileUploaded = false;


  bool? isYesSelected = false;
  bool? isNoSelected = false;


  void onChangedYes(bool? newValue) {
    setState(() {
      isYesSelected = newValue;
      isNoSelected = !newValue!; // Deselect "No" when "Yes" is selected
    });
  }

  void onChangedNo(bool? newValue) {
    setState(() {
      isNoSelected = newValue;
      isYesSelected = !newValue!; // Deselect "Yes" when "No" is selected
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

  String dropdownValueLoan = 'Select';

  // Selected value
  List<String> loanTypes = [
    'Select',
    'Nagpur',
    'Pune',
    'Nashik',
    'Amravati',
    'Wardha',
  ];

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
                      .make():
                  Text(
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
              CustomFormField(
                height: 16,
                controller: ledgerPageController.stateController,
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
                          height: 16,
                          controller:
                          ledgerPageController.cityController,
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
                    value: isYesSelected,
                    onChanged: onChangedYes,
                    activeColor: Colors.green,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  CustomCheckbox(
                    label: 'No',
                    value: isNoSelected,
                    onChanged: onChangedNo,
                    activeColor: Colors.green,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ],
              ),
              Visibility(
                  visible: isYesSelected == true,
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
                text: 'Password',
                textColor: primaryColor,
                showAsterisk: true,
              ),
              6.heightBox,
              CustomFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
                inputType: TextInputType.number,
                height: 16,
                controller: ledgerPageController.passwordController,
                label: 'Enter',
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
                value: dropdownValueLoan,
                items: loanTypes,
                onChanged: (String? val) {
                  setState(() {
                    dropdownValueLoan = val ?? 'Enter';
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
                value: dropdownValueLoan,
                items: loanTypes,
                onChanged: (String? val) {
                  setState(() {
                    dropdownValueLoan = val ?? 'Select';
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
                value: dropdownValueLoan,
                items: loanTypes,
                onChanged: (String? val) {
                  setState(() {
                    dropdownValueLoan = val ?? 'Select';
                  });
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
}

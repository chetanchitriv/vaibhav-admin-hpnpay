import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_appbar.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_button.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_checkbox.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_dialogue.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_dropdown.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_text_asteric.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_textformfield.dart';
import 'package:hpn_pay_project_avestan/routes/app_pages.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/company_dashboard_controller.dart';
import 'package:hpn_pay_project_avestan/services/image_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class ViewBankLedgerProfilePage extends StatefulWidget {
  ViewBankLedgerProfilePage({super.key});

  @override
  State<ViewBankLedgerProfilePage> createState() =>
      _CompanyCreateLedgerPageState();
}

class _CompanyCreateLedgerPageState extends State<ViewBankLedgerProfilePage> {
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
      isUpgradePlanNoSelected =
      !newValue!; // Deselect "No" when "Yes" is selected
    });
  }

  void onUpgradePlanChangedNo(bool? newValue) {
    setState(() {
      isUpgradePlanNoSelected = newValue;
      isUpgradePlanYesSelected =
      !newValue!; // Deselect "Yes" when "No" is selected
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
  void initState() {
    super.initState();
    loadSwitchState();
  }

  void loadSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      ledgerPageController.switchValue = prefs.getBool('switchValue') ?? false;
    });
  }

  void saveSwitchState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('switchValue', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: CustomAppBar(
          onBackTap: Get.back,
          leading: Icon(Icons.arrow_back_ios, color: blackColor, size: 20)
              .px4(),
          backgroundColor: whiteColor,
          child: Switch(
            value: ledgerPageController.switchValue,
            onChanged: (bool newValue) {
              setState(() {
                ledgerPageController.switchValue = newValue;
              });
              saveSwitchState(newValue);
            },
            activeColor: primaryColor,
            inactiveTrackColor: Colors.grey,
          ).px4(),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

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
                          controller: ledgerPageController.partyNameController,
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
                          controller: ledgerPageController
                              .displayNameController,
                          label: 'Display name',
                        ),
                      ),
                    ],
                  ),
                  Image
                      .asset('assets/images/viewprofile.png',)
                      .box
                      .height(153)
                      .width(116)
                      .make()
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
                readOnly: true,

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
                          readOnly: true,
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
                          readOnly: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          // Pass it as a list
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
                readOnly: true,

                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                // Pass it as a list
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
                readOnly: true,
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
                    isReadOnly: true,
                    label: 'Yes',
                    value: isYesSelected,
                    onChanged: onChangedYes,
                    activeColor: Colors.green,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  CustomCheckbox(
                    isReadOnly: true,
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
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      // Pass it as a list
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
                readOnly: true,

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
                readOnly: true,

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
                readOnly: true,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                // Pass it as a list
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
                isReadOnly: true,
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
                          readOnly: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          // Pass it as a list
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
                          readOnly: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          // Pass it as a list
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
                isReadOnly: true,
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
                readOnly: true,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                // Pass it as a list
                inputType: TextInputType.number,
                height: 16,
                controller: ledgerPageController.amountController,
                label: 'Enter',
              ),

              30.heightBox,

              Visibility(
                visible: ledgerPageController.switchValue == false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'Deactivate'.text.black.bold.size(24).make(),
                    8.heightBox,
                    CustomRichText(
                      text: 'Date',
                      textColor: primaryColor,
                      showAsterisk: true,
                    ),
                    6.heightBox,
                    GestureDetector(
                      onTap: () {
                        _selectDate(
                            context); // Call the _selectDate function on tap
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
                      text: 'Remark',
                      textColor: primaryColor,
                      showAsterisk: true,
                    ),
                    6.heightBox,
                    CustomFormField(
                      height: 16,
                      controller: ledgerPageController.remarkController,
                      label: 'Enter',
                    ),
                    20.heightBox,
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                        // onPress: () => Get.toNamed(Routes.COMPANY_ADMIN_DASHBOARD_SCREEN),
                        onPress: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomDialog(
                                // onConfirm: ,
                                child: Image.asset('assets/icons/right_tick.png', height: 60, width: 60),
                                title: "Deactivated",
                                radius: 12.0, // Set the border radius as needed
                              );
                            },
                          );

                          Future.delayed(Duration(seconds: 2), () {
                            Get.toNamed(Routes.COMPANY_ADMIN_DASHBOARD_SCREEN);
                          });
                        },
                        backgroundColor: primaryColor,
                        textColor: whiteColor,
                        text: 'Submit',
                        height: 50,
                        width: 240,
                        borderRadius: 24,

                      ),

                    )

                  ],
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

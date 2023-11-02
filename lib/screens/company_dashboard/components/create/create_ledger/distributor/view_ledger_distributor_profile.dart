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
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create/create_ledger/company_create_ledger_controller.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create/create_ledger/distributor/company_distributor_controller.dart';
import 'package:hpn_pay_project_avestan/services/image_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class ViewLedgerDistributorProfilePage extends StatefulWidget {
  ViewLedgerDistributorProfilePage({super.key});

  @override
  State<ViewLedgerDistributorProfilePage> createState() =>
      _ViewLedgerDistributorProfilePageState();
}

class _ViewLedgerDistributorProfilePageState extends State<ViewLedgerDistributorProfilePage> {
  var createLedgerDistributorController = Get.put(CompanyDistributorController());
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

  // @override
  // void initState() {
  //   super.initState();
  //   loadSwitchState();
  // }

  void loadSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      createLedgerDistributorController.switchValue = prefs.getBool('switchValue') ?? false;
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
            value: createLedgerDistributorController.switchValue,
            onChanged: (bool newValue) {
              setState(() {
                createLedgerDistributorController.switchValue = newValue;
              });
              // saveSwitchState(newValue);
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
                          controller: createLedgerDistributorController.partyNameController,
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
                          controller: createLedgerDistributorController
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
                          controller:
                          createLedgerDistributorController.cityController,
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
                          controller: createLedgerDistributorController.pinCodeController,
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
                controller: createLedgerDistributorController.mobileNumberController,
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
                controller: createLedgerDistributorController.emailAddressController,
                label: 'Enter',
              ),

              8.heightBox,
              CustomRichText(
                text: 'Pan Number',
                textColor: primaryColor,
                showAsterisk: true,
              ),
              6.heightBox,
              CustomFormField(
                readOnly: true,
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
                  'File choosed'
                      .text
                      .size(12)
                      .white
                      .make()
                      .box
                      .color(Colors.grey)
                      .p4
                      .make(),
                  Icon(Icons.check,color: Colors.white,size: 16,).box.padding(EdgeInsets.all(2)).color(Colors.green).roundedFull.make()

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
              20.heightBox,
              'Bank details'.text.black.semiBold.size(18).make(),
              10.heightBox,
              CustomRichText(
                text: 'Bank Name',
                textColor: primaryColor,
                showAsterisk: true,
              ),
              6.heightBox,
              CustomFormField(
                readOnly: true,
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
                readOnly: true,
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
                readOnly: true,
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
                readOnly: true,
                height: 16,
                controller: createLedgerDistributorController.ifscCodeController,
                label: 'Enter',
              ),
              8.heightBox,
              CustomRichText(
                text: 'Level',
                textColor: primaryColor,
                showAsterisk: true,
              ),
              6.heightBox,
              CustomFormField(
                readOnly: true,
                height: 16,
                controller: createLedgerDistributorController.salaryController,
                label: 'Level 3',
              ),
              8.heightBox,
              CustomRichText(
                text: 'Salary',
                textColor: primaryColor,
                showAsterisk: true,
              ),
              6.heightBox,
              CustomFormField(
                readOnly: true,
                height: 16,
                controller: createLedgerDistributorController.salaryController,
                label: 'By default',
              ),
              8.heightBox,
              CustomRichText(
                text: 'Joining Date',
                textColor: primaryColor,
                showAsterisk: true,
              ),
              6.heightBox,
              CustomFormField(
                readOnly: true,
                height: 16,
                controller: createLedgerDistributorController.joiningDateController,
                label: 'By default',
              ),

              20.heightBox,
              'Target'.text.black.semiBold.size(18).make(),
              10.heightBox,
              CustomRichText(
                text: 'Type of Loan',
                textColor: primaryColor,
                showAsterisk: true,
              ),
              6.heightBox,
              CustomFormField(
                readOnly: true,
                height: 16,
                controller: createLedgerDistributorController.salaryController,
                label: 'Personal Loan',
              ),
              8.heightBox,
              CustomRichText(
                text: 'Minimum File',
                textColor: primaryColor,
                showAsterisk: true,
              ),
              6.heightBox,
              CustomFormField(
                readOnly: true,
                height: 16,
                controller: createLedgerDistributorController.minimumFileController,
                label: 'Enter',
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
                          readOnly: true,
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
              CustomFormField(
                readOnly: true,
                height: 16,
                controller: createLedgerDistributorController.salaryController,
                label: 'Method of Payment',
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
                height: 16,
                controller: createLedgerDistributorController.amountController,
                label: 'Enter',
              ),
              
              8.heightBox,

              CustomRichText(
                text: 'Continue Performance',
                textColor: primaryColor,
                showAsterisk: true,
              ),
              6.heightBox,
              Row(
                children: [
                  SizedBox(
                    width: 170,
                    child: CustomFormField(
                      readOnly: true,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Pass it as a list
                      inputType: TextInputType.number,
                      height: 16,
                      controller:
                      createLedgerDistributorController.continuePerformanceController,
                      label: 'Enter',
                    ),
                  ),
                  10.widthBox,
                  'Month'.text.color(primaryColor).make()
                ],
              ),
              8.heightBox,
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: "(If Distributor continues with the target in the given months then they will be promote for next level of if they will not continues with the target then they will be promote down)".text.makeCentered(),
                ),
              ),
              30.heightBox,

              Visibility(
                visible: createLedgerDistributorController.switchValue == false,
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
                      controller: createLedgerDistributorController.remarkController,
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

                          Future.delayed(Duration(seconds: 1), () {
                            Get.toNamed(Routes.COMPANY_CREATE_LEDGER_DASHBOARD);
                          });
                        },
                        backgroundColor: primaryColor,
                        textColor: whiteColor,
                        text: 'Deactivate',
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

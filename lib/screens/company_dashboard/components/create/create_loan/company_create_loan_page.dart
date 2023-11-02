import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create/create_loan/company_create_loan_data.dart';
import 'package:hpn_pay_project_avestan/services/image_services.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_checkbox.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_appbar.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_button.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_dropdown.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_text_asteric.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_textformfield.dart';
import 'package:hpn_pay_project_avestan/routes/app_pages.dart';
import 'package:hpn_pay_project_avestan/screens/admin_dashboard/admin_dashboard_controller.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/company_dashboard_controller.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/create/create_form/company_form_data.dart';
import 'package:velocity_x/velocity_x.dart';

class CompanyCreateLoanPage extends StatefulWidget {
  CompanyCreateLoanPage({super.key});

  @override
  State<CompanyCreateLoanPage> createState() => _CompanyCreateLoanPageState();
}

class _CompanyCreateLoanPageState extends State<CompanyCreateLoanPage> {
  var createLoanController = Get.put(CompanyDashboardController());

  ImageSelector profile = ImageSelector();
  String? profileBase64 = '';
  bool isProfileUploaded = false;

  bool? isYesSelected = false;
  bool? isNoSelected = false;
  bool showAdditionalNoFields = false;

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
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: whiteColor,
        appBar: CustomAppBar(
          onBackTap: Get.back,
          leading: Icon(Icons.arrow_back_ios, color: blackColor, size: 20),
          backgroundColor: whiteColor,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: createLoanController.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget>[
                CustomRichText(
                  text: 'Add Category',
                  textColor: primaryColor,
                  showAsterisk: true,
                ),
                6.heightBox,
                CustomFormField(
                  validator: true,
                  height: 16,
                  controller: createLoanController.loanCategoryController,
                  label: 'Loan Name',
                ),
                14.heightBox,
                CustomRichText(
                  text: 'Is this Primary group',
                  textColor: primaryColor,
                  showAsterisk: true,
                ),
                Row(
                  children: [
                    CustomCheckbox(
                      label: 'Yes',
                      value: isYesSelected,
                      onChanged: onChangedYes,
                      activeColor: purpleColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    CustomCheckbox(
                      label: 'No',
                      value: isNoSelected,
                      onChanged: onChangedNo,
                      activeColor: purpleColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ],
                ),

                Visibility(
                  visible: isYesSelected == true, // Show the fields when "Yes" is selected
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      14.heightBox,
                      CustomRichText(
                        text: 'Upload Banner image',
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
                      14.heightBox,
                      CustomRichText(
                        text: 'Description',
                        textColor: primaryColor,
                        showAsterisk: true,
                      ),
                      6.heightBox,
                      CustomFormField(
                        validator: true,
                        height: 16,
                        controller: createLoanController.loanCategoryController,
                        label: 'Description',
                      ),
                      14.heightBox,
                      CustomRichText(
                        text: 'Benefits',
                        textColor: primaryColor,
                        showAsterisk: true,
                      ),
                      6.heightBox,
                      CustomFormField(
                        validator: true,
                        height: 16,
                        controller: createLoanController.loanBenefitsController,
                        label: 'Benefits',
                      ),

                      20.heightBox,
                      'Add Documents'.text.size(20).semiBold.make(),
                      20.heightBox,
                      getFormDataListUI(),
                      20.heightBox,
                      Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              CustomButton(
                                isLoading: createLoanController.isButtonLoad.value,
                                onPress: () async{
                                  Get.toNamed(Routes.COMPANY_CREATE_LOAN_DASHBOARD);
                                },
                                backgroundColor: primaryColor,
                                textColor: whiteColor,
                                text: 'Submit',
                                height: 50,
                                width: 200,
                                borderRadius: 24,
                              ),
                              10.heightBox,
                              CustomButton(
                                isLoading: createLoanController.isButtonLoad.value,
                                onPress: () async{
                                  Get.toNamed(Routes.COMPANY_CREATE_LOAN_DASHBOARD);
                                },
                                backgroundColor: primaryColor,
                                textColor: whiteColor,
                                text: 'Publish on Website',
                                height: 50,
                                width: 240,
                                borderRadius: 24,
                              ),
                            ],
                          )
                      ),
                      // Other fields related to "Yes"
                    ],
                  ),
                ),
            Visibility(
              visible: isNoSelected  == true, // Show the fields when "No" is selected
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Fields to be shown when "No" is selected
                  14.heightBox,

                  CustomRichText(
                    text: 'Select Primary category',
                    textColor: primaryColor,
                    showAsterisk: true,
                  ),
                  6.heightBox,
                  CustomDropdown(
                    hintText: 'Select',
                    value: createLoanController.dropdownValuePrimaryCategory,
                    items: createLoanController.primaryCategories,
                    onChanged: (String? val) {
                      setState(() {
                        showAdditionalNoFields = val != 'Select';
                        createLoanController.dropdownValueCity = val ?? 'Select';
                      });
                    },
                  ),

                ],
              ),),

                Visibility(
                    visible: showAdditionalNoFields,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        14.heightBox,
                        CustomRichText(
                          text: 'Upload Banner image',
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
                        14.heightBox,
                        CustomRichText(
                          text: 'Description',
                          textColor: primaryColor,
                          showAsterisk: true,
                        ),
                        6.heightBox,
                        CustomFormField(
                          validator: true,
                          height: 16,
                          controller: createLoanController.loanCategoryController,
                          label: 'Description',
                        ),
                        14.heightBox,
                        CustomRichText(
                          text: 'Benefits',
                          textColor: primaryColor,
                          showAsterisk: true,
                        ),
                        6.heightBox,
                        CustomFormField(
                          validator: true,
                          height: 16,
                          controller: createLoanController.loanBenefitsController,
                          label: 'Benefits',
                        ),

                        20.heightBox,
                        'Add Documents'.text.size(20).semiBold.make(),
                        20.heightBox,
                        getFormDataListUI(),
                        20.heightBox,
                        Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                CustomButton(
                                  isLoading: createLoanController.isButtonLoad.value,
                                  onPress: () async{
                                    Get.toNamed(Routes.COMPANY_CREATE_LOAN_DASHBOARD);
                                  },
                                  backgroundColor: primaryColor,
                                  textColor: whiteColor,
                                  text: 'Submit',
                                  height: 50,
                                  width: 200,
                                  borderRadius: 24,
                                ),
                                10.heightBox,
                                CustomButton(
                                  isLoading: createLoanController.isButtonLoad.value,
                                  onPress: () async{
                                    Get.toNamed(Routes.COMPANY_CREATE_LOAN_DASHBOARD);
                                  },
                                  backgroundColor: primaryColor,
                                  textColor: whiteColor,
                                  text: 'Publish on Website',
                                  height: 50,
                                  width: 240,
                                  borderRadius: 24,
                                ),
                              ],
                            )
                        ),
                      ],
                    ))

              ],
            ).p16(),
          ),
        ));
  }

  Widget getFormDataListUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          children: getFormDataList(),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }

  List<Widget> getFormDataList() {
    final List<Widget> noList = <Widget>[];
    int count = 0;
    const int columnCount = 2;
    for (int i = 0; i < createLoanController.companyLoanListData.length / columnCount; i++) {
      final List<Widget> listUI = <Widget>[];
      for (int i = 0; i < columnCount; i++) {
        try {
          final CompanyLoanListData date = createLoanController.companyLoanListData[count];
          listUI.add(Expanded(
            child: Row(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    onTap: () {
                      setState(() {
                        date.isSelected = !date.isSelected;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            date.isSelected
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: date.isSelected
                                ? primaryColor
                                : Colors.grey.withOpacity(0.6),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          SizedBox(
                            width: 120, // Set the width of the container
                            child: Text(
                              date.titleTxt,
                              style: TextStyle(fontSize: 12),
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
          if (count < createLoanController.companyLoanListData.length - 1) {
            count += 1;
          } else {
            break;
          }
        } catch (e) {
          print(e);
        }
      }
      noList.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: listUI,
      ));
    }
    return noList;
  }
}

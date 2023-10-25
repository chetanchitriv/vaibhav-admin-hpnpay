import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_appbar.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_button.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_dropdown.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_text_asteric.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_textfield.dart';
import 'package:hpn_pay_project_avestan/routes/app_pages.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/company_form_data.dart';
import 'package:velocity_x/velocity_x.dart';

class CompanyCreateFormPage extends StatefulWidget {
  CompanyCreateFormPage({super.key});

  @override
  State<CompanyCreateFormPage> createState() => _CompanyCreateFormPageState();
}

class _CompanyCreateFormPageState extends State<CompanyCreateFormPage> {
  var formNameController = TextEditingController();

  String dropdownValueCity = 'Select Group';

  // Selected value
  String dropdownValueArea = 'Select Sub-group';

  // Selected value
  List<String> city = [
    'Select Group',
    'Nagpur',
    'Pune',
    'Nashik',
    'Amravati',
    'Wardha',
  ];

  List<String> area = [
    'Select Sub-group',
    'Trimurti Nagar',
    'Pratap nagar',
    'Shrawan nagar',
    'Kharbi',
    'Dighori',
  ];

  List<CompanyFormListData> companyFormListData =
      CompanyFormListData.companyFormListData;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  <Widget>[
              CustomRichText(
                text: 'Form Name',
                textColor: primaryColor,
                showAsterisk: true,
              ),
              6.heightBox,
              CustomFormField(
                height: 16,
                controller: formNameController,
                label: 'Enter name',
              ),
              8.heightBox,
              CustomRichText(
                text: 'Add Group',
                textColor: primaryColor,
                showAsterisk: true,
              ),
              6.heightBox,
              CustomDropdown(
                hintText: 'Select Group',
                value: dropdownValueCity,
                items: city,
                onChanged: (String? val) {
                  setState(() {
                    dropdownValueCity = val ?? 'Select Group';
                  });
                },
              ),
              8.heightBox,
              CustomRichText(
                text: 'Address',
                textColor: primaryColor,
                showAsterisk: true,
              ),
              6.heightBox,
              CustomDropdown(
                hintText: 'Select Sub-group',
                value: dropdownValueArea,
                items: area,
                onChanged: (String? val) {
                  setState(() {
                    dropdownValueArea = val ?? 'Select Sub-group';
                  });
                },
              ),
              20.heightBox,
              'Add Field'.text.size(20).semiBold.make(),
              20.heightBox,
              getFormDataListUI(),
              20.heightBox,
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  onPress: Get.back,
                  backgroundColor: primaryColor,
                  textColor: whiteColor,
                  text: 'Create Form',
                  height: 50,
                  width: 240,
                  borderRadius: 24,
                ),
              ),

            ],
          ).p16(),
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
    for (int i = 0; i < companyFormListData.length / columnCount; i++) {
      final List<Widget> listUI = <Widget>[];
      for (int i = 0; i < columnCount; i++) {
        try {
          final CompanyFormListData date = companyFormListData[count];
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
                          Text(
                            date.titleTxt,
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
          if (count < companyFormListData.length - 1) {
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

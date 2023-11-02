import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_button.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_dropdown.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_profile_appbar.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_text_asteric.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_textformfield.dart';
import 'package:hpn_pay_project_avestan/screens/admin_dashboard/widgets/admin_drawer.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/components/career/company_career_page_controller.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/widgets/company_drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class CompanyCareerPage extends StatefulWidget {
  const CompanyCareerPage({Key? key}) : super(key: key);

  @override
  State<CompanyCareerPage> createState() => _CompanyCareerPageState();
}

class _CompanyCareerPageState extends State<CompanyCareerPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: whiteColor,
      drawer: CompanyDrawerWidget(),
      appBar: CustomProfileAppBar(
        defaultAppBarHeight: 110,
        scaffoldKey: _scaffoldKey,
        bottom: TabBar(
          indicatorColor: Colors.transparent,
          controller: _tabController,
          tabs: [
            CustomButton(
              borderRadius: 6,
              height: 40,
              width: 200,
              backgroundColor: primaryColor,
              text: 'Post Job',
              textColor: whiteColor,
            ),
            CustomButton(
              borderColor: primaryColor,
              borderRadius: 6,
              height: 40,
              width: 200,
              backgroundColor: whiteColor,
              text: 'Posted Job',
              textColor: primaryColor,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PostJobPage(),
          PostedJobPage(),
        ],
      ),
    );
  }
}

class PostJobPage extends StatefulWidget {
  @override
  State<PostJobPage> createState() => _PostJobPageState();
}

class _PostJobPageState extends State<PostJobPage> {
  DateTime selectedDate = DateTime.now();

  var careerPageController = Get.put(CompanyCareerPageController());
  String dropdownValueLevel = 'Select';
  List<String> levelsList = [
    'Select',
    'Level 1',
    'Level 2',
    'Level 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        16.heightBox,
        CustomRichText(
          text: 'Level',
          textColor: primaryColor,
          showAsterisk: true,
        ),
        6.heightBox,
        CustomDropdown(
          hintText: 'Select',
          value: dropdownValueLevel,
          items: levelsList,
          onChanged: (String? val) {
            setState(() {
              dropdownValueLevel = val ?? 'Select';
            });
          },
        ),
        8.heightBox,
        CustomRichText(
          text: 'Job Description',
          textColor: primaryColor,
          showAsterisk: true,
        ),
        6.heightBox,
        CustomFormField(
          height: 16,
          controller: careerPageController.jobCategoryController,
          label: 'Enter',
        ),
        8.heightBox,
        CustomRichText(
          text: 'Salary',
          textColor: primaryColor,
          showAsterisk: true,
        ),
        6.heightBox,
        CustomFormField(
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          // Pass it as a list
          inputType: TextInputType.number,
          height: 16,
          controller: careerPageController.salaryController,
          label: 'Enter',
        ),
        8.heightBox,
        CustomRichText(
          text: 'Job Category',
          textColor: primaryColor,
          showAsterisk: true,
        ),
        6.heightBox,
        CustomFormField(
          height: 16,
          controller: careerPageController.jobCategoryController,
          label: 'By Default',
        ),
        8.heightBox,
        CustomRichText(
          text: 'Compulsary requirement',
          textColor: primaryColor,
          showAsterisk: true,
        ),
        6.heightBox,
        CustomFormField(
          height: 16,
          controller: careerPageController.salaryController,
          label: 'Compulsary requirement',
        ),
        8.heightBox,
        CustomRichText(
          text: 'Number of Vacancy',
          textColor: primaryColor,
          showAsterisk: true,
        ),
        6.heightBox,
        CustomFormField(
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          // Pass it as a list
          inputType: TextInputType.number,
          height: 16,
          controller: careerPageController.salaryController,
          label: 'Enter',
        ),
        8.heightBox,
        CustomRichText(
          text: 'Job deadline',
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
        20.heightBox,
        Align(
          alignment: Alignment.center,
          child: CustomButton(

            height: 40,
            width: 160,
            backgroundColor: primaryColor,
            text: 'Submit',
            textColor: whiteColor,
            borderRadius: 22,
          ),
        )

      ],
    ).p16();
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

class PostedJobPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Posted Job'),
    );
  }
}

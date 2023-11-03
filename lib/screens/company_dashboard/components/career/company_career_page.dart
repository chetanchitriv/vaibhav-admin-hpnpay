import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_button.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_dropdown.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_profile_appbar.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_text_asteric.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_textformfield.dart';
import 'package:hpn_pay_project_avestan/routes/app_pages.dart';
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
    _tabController = new TabController(vsync: this, length: 2);
    _tabController!.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
    });
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
          onTap: (index) {
            setState(() {
              // Update the tab selection when a tab is tapped
              _tabController!.index = index;
            });
          },
          tabs: [
            CustomButton(
              borderColor: primaryColor,
              borderRadius: 6,
              height: 40,
              width: 200,
              backgroundColor: _tabController!.index == 0
                  ? primaryColor // Change color for the first tab
                  : whiteColor,
              text: 'Post Job',
              textColor: _tabController!.index == 0
                  ? whiteColor // Change text color for the first tab
                  : primaryColor, ),
            CustomButton(
              borderColor: primaryColor,
              borderRadius: 6,
              height: 40,
              width: 200,
              backgroundColor: _tabController!.index == 1
                  ? primaryColor // Change color for the second tab
                  : whiteColor,
              text: 'Posted Job',
              textColor: _tabController!.index == 1
                  ? whiteColor // Change text color for the second tab
                  : primaryColor,   ),
          ],
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
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
    'Level 4',
    'Level 5',
    'Level 6',
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
            .padding(const EdgeInsets.all(10))
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Gap(20),
          'Posted Job'.text.black.semiBold.size(18).make(),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            // You can set the number of shimmer items you want to display
            itemBuilder: (context, index) {
              return Card(
                  elevation: 1,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          'HR'.text.make(),
                          const Spacer(),
                          'Salary: 20,000/month'.text.make()
                        ],
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          'HR Job'.text.make(),
                          const Spacer(),
                          'Deadline: 12/11/23'.text.make()
                        ],
                      ),
                      const Gap(20),
                      CustomButton(
                        onPress: ()=>
                            Get.toNamed(Routes.COMPANY_CAREER_APPLICATIONS_LIST),
                          borderRadius: 6,
                          backgroundColor: primaryColor,
                          width: 200,
                          height: 35,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18, right: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                'View Application'.text.size(12).white.make(),
                                Spacer(),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: whiteColor,
                                  size: 12,
                                ),
                              ],
                            )
                          ))
                    ],
                  ).p16());
            },
          )
        ],
      ).p16(),
    );
  }
}

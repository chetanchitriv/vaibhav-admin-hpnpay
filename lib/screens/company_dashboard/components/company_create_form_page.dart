import 'package:flutter/material.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/widgets/company_drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class CompanyCreateFormPage extends StatelessWidget {
  CompanyCreateFormPage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // final List<Icon> icons = <Icon>['assets/icons/create.png','assets/icons/create.png','assets/icons/create.png','assets/icons/create.png'];
  final List<String> companyCreateFormTitle = <String>[
    'Create Form',
    'Create group',
    'Create Loan',
    'Create Level',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      key: _scaffoldKey,
      drawer: CompanyDrawerWidget(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        leading: InkWell(
            onTap: (){
              _scaffoldKey.currentState!.openDrawer();
            },
            child: Image.asset('assets/icons/drawer.png')),
        title: Row(
          children: [
            Spacer(),
            ClipRRect(
              child: Image.asset('assets/images/profile.jpg'),
            ),
            8.widthBox,

            'Priya Sharma'.text.color(primaryColor).size(12).make(),
            4.widthBox,
            Icon(Icons.keyboard_arrow_down,color: primaryColor,size: 16,),
            8.widthBox,

            Image.asset('assets/icons/notifications.png')
          ],
        ),
      ),
      body: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
            2, // You can change the number of columns as needed
            mainAxisSpacing: 16,
            crossAxisSpacing: 16),
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: companyCreateFormTitle.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.ac_unit).box.color(Colors.grey.withOpacity(0.1)).make(),
              10.heightBox,
              'Employee'.text.color(greyColor).size(12).make(),
            ],
          ).box.color(Colors.grey.withOpacity(0.1)).p16.roundedSM.make();
        },
      ),

    );
  }
}

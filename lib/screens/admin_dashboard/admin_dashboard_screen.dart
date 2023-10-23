import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_button.dart';
import 'package:hpn_pay_project_avestan/routes/app_pages.dart';
import 'package:hpn_pay_project_avestan/screens/admin_dashboard/widgets/admin_drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({Key? key});

  @override
  _AdminDashboardScreenState createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> companyList = <String>[
    'DSA',
    'Nidhi PVT.LTD',
    'Nidhi PVT.LTD',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the GlobalKey to the Scaffold
      backgroundColor: whiteColor,
      drawer: AdminDrawerWidget(),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomButton(
              onPress: ()=> Get.toNamed(Routes.ADMIN_CREATE_COMPANY_PAGE),
              borderRadius: 6,
              height: 40,
              width: 180,
              backgroundColor: primaryColor,
              text: 'Create Company',
              textColor: whiteColor,
            ),
            40.heightBox,
            'Added Companies'.text.semiBold.color(blackColor).make(),
            15.heightBox,

            ListView.builder(
                shrinkWrap: true,
                itemCount: companyList.length,
                itemBuilder: (BuildContext context, int index){
                  return Column(
                    children: [
                      Row(
                        children: [
                          companyList[index].text.semiBold.size(18).color(blackColor).make(),
                          Spacer(),
                          Image.asset('assets/icons/arrow_right.png',height: 34,width: 34,)
                        ],
                      ).box.height(50).padding(EdgeInsets.only(top: 12,bottom: 12,right: 20,left: 18)).withDecoration( BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(4.0), // Adjust the radius as needed
                      ),).make().onTap(() {

                        Get.toNamed(Routes.COMPANY_DASHBOARD_SCREEN);
                      }),
                      20.heightBox,
                    ],
                  );
                })
          ],
        ),
      )
    );
  }
}

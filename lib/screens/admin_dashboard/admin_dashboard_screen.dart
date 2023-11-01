import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_button.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_loading_indicator.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_profile_appbar.dart';
import 'package:hpn_pay_project_avestan/routes/app_pages.dart';
import 'package:hpn_pay_project_avestan/screens/admin_dashboard/admin_dashboard_controller.dart';
import 'package:hpn_pay_project_avestan/screens/admin_dashboard/widgets/admin_drawer.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/company_dashboard_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({Key? key});

  @override
  _AdminDashboardScreenState createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var adminDashboardController = Get.put(AdminDashboardController());
  late Future<List<Map<String, dynamic>>?> futureData;

  @override
  void initState() {
    super.initState();
    futureData = adminDashboardController.fetchCompanyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        // Assign the GlobalKey to the Scaffold
        backgroundColor: whiteColor,
        drawer: AdminDrawerWidget(),
        appBar: CustomProfileAppBar(
          scaffoldKey: _scaffoldKey,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
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
                FutureBuilder(
                  future: futureData,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10, // You can set the number of shimmer items you want to display
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: shimmerBaseColor,
                            highlightColor: shimmerHighlightColor,
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.only(top: 12, bottom: 12, right: 20, left: 18),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.withOpacity(0.4)),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.data!.isEmpty) {
                      return "No orders yet!".text.color(darkFontGrey).makeCentered();
                    } else {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          final data = snapshot.data![index];
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    data['companyName'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: blackColor,
                                    ),
                                  ),
                                  Spacer(),
                                  Image.asset('assets/icons/arrow_right.png',
                                      height: 34, width: 34),
                                ],
                              )
                                  .box
                                  .height(50)
                                  .padding(EdgeInsets.only(
                                  top: 12, bottom: 12, right: 20, left: 18))
                                  .withDecoration(
                                BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.4)),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              )
                                  .make()
                                  .onTap(() {
                                Get.to(CompanyDashboardScreen(companyName: data['companyName']));
                              }),
                              20.heightBox,
                            ],
                          );
                        },
                      );
                    }
                  },
                )
 ],
            ),
          ),
        )
        );
  }
}



import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_appbar.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_textformfield.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../constants/app_colors.dart';

class CompanyCareerApplicationsList extends StatelessWidget {
  CompanyCareerApplicationsList({super.key});

  var searchController = TextEditingController();

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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            'Detail list of Jobs Application'.text.black.size(16).make(),
            Gap(20),
            Row(
              children: [
                'Total Applications :1'.text.black.size(16).make(),
                Gap(10),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(6),
                    height: 40, // Set the desired height
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black.withOpacity(0.2)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black.withOpacity(0.2)),
                        ),
                        prefixIcon: Row(
                          children: [
                            Gap(2),
                            Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 14,
                            ),
                            Gap(2),
                            'Search'.text.size(8).make()
                          ],
                        ),
                      ),
                      textAlign: TextAlign.center, // Center the text
                      style: TextStyle(
                        fontSize: 12, // Set the desired font size
                      ),
                    ),
                  ),
                ),
                Gap(10),
                Image.asset(
                  'assets/icons/download_icon.png',
                  height: 20,
                  width: 20,
                ).box.height(30).width(30).roundedSM.color(primaryColor).make()
              ],
            ),
            Gap(20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                    ),
                    Gap(20),
                    'Name'.text.color(primaryColor).size(6).make(),
                    Gap(20),
                    'Email'.text.color(primaryColor).size(6).make(),
                    Gap(20),

                    'Status'.text.color(primaryColor).size(6).make(),
                    Gap(20),

                    'CV'.text.color(primaryColor).size(6).make(),
                    Gap(20),

                    'Add Interviewer'.text.color(primaryColor).size(6).make(),
                    Gap(20),

                    'Action'.text.color(primaryColor).size(6).make(),
                  ],
                ),
                Gap(20),
                Container(height: 1,color: primaryColor,),
                Gap(20),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 2,
                  // You can set the number of shimmer items you want to display
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                              ),
                            ),
                            Gap(20),
                            'Priya'.text.color(primaryColor).size(6).make(),
                            Gap(20),
                            'priyasharma@gmail.com'.text.color(primaryColor).size(6).make(),
                            Gap(20),

                            'Pending'.text.color(Colors.red).bold.size(6).make(),
                            Gap(20),

                            'Download'.text.color(primaryColor).size(6).makeCentered().box.height(16).width(70).withDecoration(BoxDecoration(
                              border: Border.all(color: Colors.black.withOpacity(0.4)),
                              borderRadius: BorderRadius.circular(4)
                            ),).make(),
                            Gap(20),
                            'Add Interviewer'.text.color(primaryColor).size(6).makeCentered().box.height(16).width(70).withDecoration(BoxDecoration(
                                border: Border.all(color: Colors.black.withOpacity(0.4)),
                                borderRadius: BorderRadius.circular(4)
                            ),).make(),
                            Gap(20),

                            'Action'.text.color(primaryColor).size(6).makeCentered().box.height(16).width(70).withDecoration(BoxDecoration(
                                border: Border.all(color: Colors.black.withOpacity(0.4)),
                                borderRadius: BorderRadius.circular(4)
                            ),).make(),
                          ],
                        ),
                        Gap(40)
                      ],
                    );
                  },
                )

                ,
              ],
            ),
          ],
        ).p16(),
      ),
    );
  }
}
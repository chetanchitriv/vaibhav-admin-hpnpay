import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_appbar.dart';
import 'package:velocity_x/velocity_x.dart';

class CompanyViewLoanInDetailPage extends StatelessWidget {
  String title;
  CompanyViewLoanInDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(
        onBackTap: Get.back,
        leading: Icon(Icons.arrow_back_ios, color: blackColor, size: 20),
        backgroundColor: whiteColor,
        // child: 'nsfsdf'.text.black.make(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title.text.size(24).semiBold.make(),
                12.heightBox,
                Image.asset('assets/images/background.jpg',width: double.infinity,),
                12.heightBox,
                'Description'.text.size(24).semiBold.make(),
                16.heightBox,
                "Lorem ipsum dolor sit amet, consectectur adipiscing elit, sed do eiusmod tempor i"
                    .text
                    .make(),
                16.heightBox,
                'Benefits'.text.size(24).semiBold.make(),
                12.heightBox,
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (1.7 / 2),
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                  ),
                  shrinkWrap: true,
                  // padding: const EdgeInsets.all(8),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {

                    return Card(
                      elevation: 0,
                      semanticContainer: true,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/images/loan_back.jpg'),
                            10.heightBox,
                            'Venue and Decor'
                                .text.black
                                .color(primaryColor)
                                .size(16)
                                .make(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ).p16()
          ],
        ),
      ),
    );
  }
}

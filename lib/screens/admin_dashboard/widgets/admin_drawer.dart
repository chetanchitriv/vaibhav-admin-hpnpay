import 'package:flutter/material.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_button.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      backgroundColor: whiteColor,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: whiteColor,
            ),
            child: Image.asset('assets/images/logo.png',height: 279,width: 189,),

          ),
          ListTile(
            leading: Image.asset('assets/icons/dashboard.png',height: 40,width: 40,),
            title: 'Dashboard'.text.bold.size(16).make(),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Image.asset('assets/icons/help_flag.png',height: 40,width: 40,),
            title: 'Help'.text.bold.size(16).make(),

            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Image.asset('assets/icons/logout.png',height: 40,width: 40,),
            title: 'Logout'.text.bold.size(16).make(),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                'Found an bug?'.text.semiBold.color(primaryColor).size(20).make(),
                5.heightBox,
                'Report now to us if you find any bugs'.text.color(Colors.grey.withOpacity(0.6)).size(8).make(),
                15.heightBox,
                CustomButton(
                  width: double.infinity,
                  borderRadius: 8,
                  backgroundColor: primaryColor,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/danger.png',color: Colors.white,),
                      5.widthBox,
                      'Report'.text.white.make()
                    ],
                  ),
                )
              ],
            ).box.color(Colors.grey.withOpacity(0.2)).padding(EdgeInsets.all(18)).roundedSM.make(),
          )
        ],
      )
    );
  }
}

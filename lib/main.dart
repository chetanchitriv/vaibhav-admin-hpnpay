import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: Routes.PHONE_AUTH_SCREEN,
      getPages: AppPages.pages,
    );
  }
}
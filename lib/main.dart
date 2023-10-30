import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/routes/app_pages.dart';
import 'package:hpn_pay_project_avestan/services/local_storage_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  changeScreen() async {
    final isUser = await StorageService.getUserType();
    if (isUser == true) {
      Get.toNamed(Routes.ADMIN_DASHBOARD_SCREEN);
    } else {
      Get.toNamed(Routes.PHONE_AUTH_SCREEN);
    }
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

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

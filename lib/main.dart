import 'package:Seef/app/services/setting_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/theme_app_pages.dart';
import 'common/color_manager.dart';
import 'common/constants.dart';

SharedPreferences? sharedPref;

Future initServices() async {
  Get.log('starting services ...');
  sharedPref = await SharedPreferences.getInstance();
  Get.log('========== init SharedPreferences services ==========');
  Get.put<SettingServices>(SettingServices());
  Get.log('========== init SessionServices controller ==========');
  Get.log('All services started...');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
              title: Constants.appName,
              initialRoute: ThemeAppPages.initial,
              onReady: () async {},
              getPages: ThemeAppPages.routes,
              debugShowCheckedModeBanner: false,
              defaultTransition: Transition.cupertino,
              theme: ThemeData(
                  primarySwatch: ColorManager.primarySwatchColors,
                  fontFamily: 'Cairo',
                  appBarTheme: const AppBarTheme(
                      iconTheme: IconThemeData(color: Colors.black),
                      color: Colors.deepPurpleAccent,
                      foregroundColor: Colors.black,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarIconBrightness: Brightness.dark,
                          statusBarBrightness: Brightness.light))));
        });
  }
}

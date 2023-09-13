import 'dart:convert';

import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/theme_app_pages.dart';
import 'app/services/session_services.dart';
import 'common/color_manager.dart';
import 'common/constants.dart';

SharedPreferences? sharedPref;
final encoding = Encoding.getByName('utf-8');
final Config config = Config(
    tenant: 'd7be1e00-bf67-40de-a606-1a75a207d413',
    clientId: '1789a239-2a62-402b-9670-4f8722c8f7b5',
    scope:
        'openid profile offline_access https://initiumsolutionsdefault.crm4.dynamics.com/.default',
    redirectUri: 'https://bar.crm4.dynamics.com/XRMServices/2011/Organization.svc',
    clientSecret: 'wEM8Q~VQAaFhIMLl5vx1cg4AHXSr6oJX2HGHcak6');
final oauth = AadOAuth(config);

Future initServices() async {
  Get.log('starting services ...');
  sharedPref = await SharedPreferences.getInstance();
  Get.log('========== init SharedPreferences services ==========');
  Get.put<SessionServices>(SessionServices());
  Get.log('========== init SessionServices controller ==========');
  Get.log('All services started...');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
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

import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/routes/theme_app_pages.dart';
import 'app/services/check_internet_connection_service.dart';
import 'app/services/session_services.dart';
import 'common/color_manager.dart';
import 'common/constants.dart';

SharedPreferences? sharedPref;
final encoding = Encoding.getByName('utf-8');

Future initServices() async {
  Get.log('starting services ...');
  Get.put(InternetConnectionController(connectivity: Connectivity()));
  var connectivityResult = await (Connectivity().checkConnectivity());

  bool isConnected = (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi);
  Get.find<InternetConnectionController>().isConnected.value = isConnected;
  Get.log('========== checked on internet connection ==========');
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

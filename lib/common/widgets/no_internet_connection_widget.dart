import 'package:bareeq/common/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../color_manager.dart';
import '../images_paths.dart';

class NoInternetConnectionView extends StatelessWidget {
  const NoInternetConnectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.mainColor,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(ImagePaths.noInternetConnection,
                  width: 300.w, height: 300.h, alignment: Alignment.center),
              SizedBox(height: 20.h),
              Center(
                  child: Text(Strings.notConnectedToInternet,
                      style: TextStyle(
                          fontSize: 18.sp, color: ColorManager.white)))
            ]));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import '../color_manager.dart';
import '../images_paths.dart';

AppBar customMainAppBar(
    {required String title, String? svgEmailIcon, String? svgProfileIcon}) {
  return AppBar(
      backgroundColor: ColorManager.mainColor,
      title: Text(title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
              color: ColorManager.white)),
      actions: [
        GestureDetector(
            onTap: () {
              Get.toNamed(Routes.messages);
            },
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: SvgPicture.asset(svgEmailIcon ?? ImagePaths.email,
                    height: 20.h, width: 22.w))),
        GestureDetector(
            onTap: () {
              Get.toNamed(Routes.profile);
            },
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: SvgPicture.asset(svgProfileIcon ?? ImagePaths.person,
                    height: 20.h, width: 22.w)))
      ],
      iconTheme: IconThemeData(color: ColorManager.white));
}

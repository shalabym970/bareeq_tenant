import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:property_pro/common/color_manager.dart';
import 'package:property_pro/common/images_paths.dart';

AppBar customAppBar({required String title}) {
  return AppBar(
    backgroundColor: ColorManager.darkBlue,
    title: Text(title),
    actions: [
      GestureDetector(
        child: Padding(
            padding: EdgeInsets.all(8.h),
            child:
                SvgPicture.asset(ImagePaths.email, height: 16.h, width: 22.w)),
      ),
      GestureDetector(
        child: Padding(
            padding: EdgeInsets.all(8.h),
            child:
                SvgPicture.asset(ImagePaths.person, height: 16.h, width: 22.w)),
      ),
    ],
  );
}

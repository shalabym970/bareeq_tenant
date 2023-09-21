import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color_manager.dart';

AppBar customDetailsAppBar({required String title, String? svgEmailIcon}) {
  return AppBar(
      backgroundColor: ColorManager.mainColor,
      title: Text(title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
              color: ColorManager.white)),
      iconTheme: IconThemeData(color: ColorManager.white));
}

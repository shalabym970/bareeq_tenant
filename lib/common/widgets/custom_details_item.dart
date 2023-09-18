import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../color_manager.dart';

Widget customDetailsItem(
    {required String icon,
    required String title,
    required String value,
    Color? color}) {
  return Row(
    children: [
      Padding(
        padding: EdgeInsets.all(5.h),
        child: SvgPicture.asset(
          icon,
          height: 24.h,
          width: 24.w,
          color: color,
        ),
      ),
      Expanded(
        child: Padding(
            padding: EdgeInsets.all(5.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: ColorManager.mainColor)),
                SizedBox(
                  height: 5.h,
                ),
                Text(value,
                    style:
                        TextStyle(fontSize: 12.sp, color: ColorManager.black))
              ],
            )),
      )
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings/strings.dart';

Future workPermitTerm() {
  return showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text(Strings.workPermitTermsTile,
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            content: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  Text(Strings.workPermitTermsFirstDialog,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.sp),
                      textAlign: TextAlign.center),
                  SizedBox(height: 10.h),
                  Text(Strings.workPermitTermsSecondDialog,
                      style: TextStyle(fontSize: 13.sp),
                      textAlign: TextAlign.center)
                ])),
            actions: <Widget>[
              TextButton(
                  child: Text(Strings.ok,
                      style: TextStyle(
                          color: ColorManager.mainColor, fontSize: 13.sp),
                      textAlign: TextAlign.center),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ]);
      });
}

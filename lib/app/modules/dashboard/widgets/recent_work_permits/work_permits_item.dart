import 'package:bareeq/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/color_manager.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../models/work_permit.dart';
import '../../../../routes/app_routes.dart';

class WorkPermitItem extends StatelessWidget {
  const WorkPermitItem({Key? key, required this.workPermit}) : super(key: key);
  final WorkPermit workPermit;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.workPermitDetails, arguments: workPermit);
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.h)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1.h,
                          blurRadius: 3.h,
                          offset: Offset(0, 3.h) // changes position of shadow
                          )
                    ]),
                height: 62.h,
                child: Card(
                    color: ColorManager.textFieldBg,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Row(children: [
                          Expanded(
                              flex: 1,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(Strings.subject,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                            color: ColorManager.mainColor)),
                                    SizedBox(height: 3.h),
                                    Text(workPermit.subject ?? Strings.na,
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: ColorManager.black),
                                        maxLines: 1)
                                  ])),
                          Expanded(
                              flex: 1,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(Strings.type,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                            color: ColorManager.mainColor)),
                                    SizedBox(height: 3.h),
                                    Text(
                                        workPermit.type == true
                                            ? Constants.emergency
                                            : Constants.standard,
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: ColorManager.black))
                                  ])),
                          Expanded(
                              flex: 1,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(Strings.contractor,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                            color: ColorManager.mainColor)),
                                    SizedBox(height: 3.h),
                                    Text(
                                        workPermit.contractor?.name ??
                                            Strings.na,
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: ColorManager.black),
                                        maxLines: 1)
                                  ]))
                        ]))))));
  }
}

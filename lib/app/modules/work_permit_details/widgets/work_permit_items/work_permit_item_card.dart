import 'package:bareeq/app/models/work_permit_item.dart';
import 'package:bareeq/app/services/general_services.dart';
import 'package:bareeq/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common/color_manager.dart';
import '../../../../../common/strings/strings.dart';

class WorkPermitItemCard extends StatelessWidget {
  const WorkPermitItemCard({Key? key, required this.workPermitItem})
      : super(key: key);
  final WorkPermitItem workPermitItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Container(
            height: 100.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.h)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0.4,
                  blurRadius: 1,
                  offset: Offset(0, 3.h), // changes position of shadow
                ),
              ],
            ),
            width: 155.w,
            child: Card(
                color: ColorManager.textFieldBg,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(Strings.type,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                  color: ColorManager.mainColor)),
                          SizedBox(height: 3.h),
                          Text(
                              workPermitItem.type != null
                                  ? GeneralServices.getKeyFromValue(
                                      Constants.workPermitItemTypesMap,
                                      workPermitItem.type!)
                                  : Strings.na,
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.black.withOpacity(0.7))),
                          SizedBox(height: 3.h),
                          Expanded(
                              child: Text(workPermitItem.description.toString(),
                                  style: TextStyle(
                                      height: 2.h,
                                      fontSize: 9.sp,
                                      color: ColorManager.black),
                                  maxLines: 5,
                                  overflow: TextOverflow.visible)),
                          SizedBox(height: 3.h),
                          Row(children: [
                            Text(Strings.id,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                    color: ColorManager.mainColor)),
                            SizedBox(width: 3.w),
                            Text(workPermitItem.id.toString(),
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.black.withOpacity(0.7)))
                          ])
                        ])))));
  }
}

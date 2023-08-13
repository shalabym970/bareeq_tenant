import 'package:Seef/app/models/work_permit_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common/color_manager.dart';
import '../../../../../common/strings/strings.dart';

class WorkPermitItemCard extends StatelessWidget {
  const WorkPermitItemCard({Key? key, required this.workPermitItem}) : super(key: key);
  final WorkPermit workPermitItem;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 2.w),child:  Container(
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
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(Strings.subject,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                      color: ColorManager.mainColor)),
              SizedBox(
                height: 5.h,
              ),
              Text(workPermitItem.id.toString(),
                  style: TextStyle(
                      fontSize: 12.sp, color: Colors.black.withOpacity(0.7))),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: Text(
                  workPermitItem.description.toString(),
                  style: TextStyle(
                      height: 2.h, fontSize: 12.sp, color: ColorManager.black),
                  maxLines: 4,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
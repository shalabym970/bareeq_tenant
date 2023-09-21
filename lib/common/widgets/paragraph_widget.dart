import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../color_manager.dart';
import '../../app/modules/work_permit_details/controllers/work_permit_details_controller.dart';

class ParagraphWidget extends GetView<WorkPermitDetailsController> {
  const ParagraphWidget(
      {Key? key, required this.title, required this.description})
      : super(key: key);
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400)),
          SizedBox(height: 20.h),
          Text(description,
              style: TextStyle(
                  fontSize: 12.sp,
                  color: ColorManager.black,
                  fontWeight: FontWeight.w400,
                  height: 1.5.h))
        ]));
  }
}

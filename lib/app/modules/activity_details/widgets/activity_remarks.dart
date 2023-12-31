import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../common/color_manager.dart';
import '../../../../common/strings/strings.dart';
import '../controllers/activity_details_controller.dart';

class ActivityRemarks extends GetView<ActivityDetailsController>  {
  const ActivityRemarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(Strings.remarks,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400)),
          SizedBox(height: 20.h),
          Text(
            controller.fitOutStep.description.toString(),
            style: TextStyle(
                fontSize: 12.sp,
                color: ColorManager.black,
                fontWeight: FontWeight.w400,
                height: 1.5.h),
          ),
        ],
      ),
    );
  }
}

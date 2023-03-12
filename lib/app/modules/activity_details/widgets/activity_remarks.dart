import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/color_manager.dart';
import '../../../../common/strings/strings.dart';

class ActivityRemarks extends StatelessWidget {
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
            'Once the documentation and lease agreement have been finalized, the tenant to • Appoint their fitout team. (Form 2) • Attend formal meeting with SEEF Fit-Out Team to agree on the procedures for Fit-Out • Understand the design criteria and deliverables • Submit fit-out program milestone prior to the submission of conceptual design. (Form 3) • Artwork for hoarding to be submitted for approval.',
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

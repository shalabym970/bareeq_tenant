import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';

class LeaseDatesWidget extends StatelessWidget {
  const LeaseDatesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(6.h),
            child: Text(
              Strings.dates,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
          ),
          customDetailsItem(
              icon: ImagePaths.filingTime,
              title: Strings.communicationDate,
              value: '10-November-2022'),
          SizedBox(
            height: 20.h,
          ),
          customDetailsItem(
              icon: ImagePaths.filingTime,
              title: Strings.startDate,
              value: '10-November-2022'),
          SizedBox(
            height: 20.h,
          ),
          customDetailsItem(
              icon: ImagePaths.filingTime,
              title: Strings.terminationDate,
              value: '10-November-2022'),
          SizedBox(
            height: 20.h,
          ),
          customDetailsItem(
              icon: ImagePaths.filingTime,
              title: Strings.endDate,
              value: '10-November-2022'),
        ],
      ),
    );
  }
}

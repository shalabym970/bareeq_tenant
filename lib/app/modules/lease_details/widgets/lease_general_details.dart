import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_pro/common/images_paths.dart';

import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_pro/common/images_paths.dart';

import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';


class LeaseGeneralDetailsWidget extends StatelessWidget {
  const LeaseGeneralDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.generalDetails,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customDetailsItem(
                      icon: ImagePaths.path79,
                      title: Strings.leaseNumber,
                      value: 'Lease-25'),
                  SizedBox(
                    height: 20.h,
                  ),

                  customDetailsItem(
                      icon: ImagePaths.deleteCalendar,
                      title: Strings.contactPeriod,
                      value: '24 Months'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customDetailsItem(
                      icon: ImagePaths.documentLayout,
                      title: Strings.type,
                      value: 'New Lease'),
                  SizedBox(
                    height: 20.h,
                  ),
                  customDetailsItem(
                      icon: ImagePaths.pylon,
                      title: Strings.priority,
                      value: 'Draft')
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

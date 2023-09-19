import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart' as intl;
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';
import '../controllers/leased_property_details_controller.dart';

class LeasedPropertyDatesWidget extends GetView<LeasedPropertyDetailsController> {
  const LeasedPropertyDatesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              value: intl.DateFormat('EEE d MMM y')
                  .format(controller.lease.commencementDate!)
                  .toString()),
          SizedBox(
            height: 20.h,
          ),
          customDetailsItem(
              icon: ImagePaths.filingTime,
              title: Strings.startDate,
              value: intl.DateFormat('EEE d MMM y')
                  .format(controller.lease.commencementDate!)
                  .toString()),
          SizedBox(
            height: 20.h,
          ),
          customDetailsItem(
              icon: ImagePaths.filingTime,
              title: Strings.terminationDate,
              value: intl.DateFormat('EEE d MMM y')
                  .format(controller.lease.terminationDate!)
                  .toString()),
          SizedBox(height: 20.h),
          customDetailsItem(
              icon: ImagePaths.filingTime,
              title: Strings.endDate,
              value: intl.DateFormat('EEE d MMM y')
                  .format(controller.lease.endDate!)
                  .toString())
        ]));
  }
}
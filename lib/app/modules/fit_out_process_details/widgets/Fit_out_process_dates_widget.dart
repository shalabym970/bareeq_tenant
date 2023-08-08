import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';
import '../controllers/fit_out_process_details_controller.dart';

class FitOutProcessDatesWidget extends GetView<FitOutProcessDetailsController> {
  const FitOutProcessDatesWidget({Key? key}) : super(key: key);

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
              title: Strings.startDate,
              value: controller.fitOut.startDate == null
                  ? Strings.na
                  : DateFormat("yyyy-MM-dd")
                      .format(controller.fitOut.startDate!)),
          SizedBox(
            height: 20.h,
          ),
          customDetailsItem(
              icon: ImagePaths.filingTime,
              title: Strings.completionDate,
              value: controller.fitOut.completedDate == null
                  ? Strings.na
                  : DateFormat("yyyy-MM-dd")
                      .format(controller.fitOut.completedDate!)),
          SizedBox(
            height: 20.h,
          ),
          customDetailsItem(
              icon: ImagePaths.filingTime,
              title: Strings.expectedOpeningDate,
              value: controller.fitOut.expectedOpeningDate == null
                  ? Strings.na
                  : DateFormat("yyyy-MM-dd")
                      .format(controller.fitOut.expectedOpeningDate!)),
        ],
      ),
    );
  }
}

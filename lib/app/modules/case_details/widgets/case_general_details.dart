import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart' as intl;
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';
import '../controllers/case_details_controller.dart';


class CaseGeneralDetailsWidget extends GetView<CaseDetailsController> {
  const CaseGeneralDetailsWidget({Key? key}) : super(key: key);

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
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customDetailsItem(
                        icon: ImagePaths.path79,
                        title: Strings.caseNumber,
                        value: controller.recentCases.caseNumber.toString()),
                     SizedBox(
                      height: 20.h,
                    ),
                    customDetailsItem(
                        icon: ImagePaths.documentLayout,
                        title: Strings.type,
                        value: controller.recentCases.type.toString())
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customDetailsItem(
                        icon: ImagePaths.deleteCalendar,
                        title: Strings.dateSubmitted,
                        value: intl.DateFormat('EEE d MMM y')
                            .format(controller.recentCases.submittedOn!)
                            .toString()),
                     SizedBox(
                      height: 20.h,
                    ),
                    customDetailsItem(
                        icon: ImagePaths.import,
                        title: Strings.priority,
                        value: controller.recentCases.priority.toString())
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

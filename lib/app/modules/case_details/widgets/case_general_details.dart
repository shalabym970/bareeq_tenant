import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import '../../../../common/constants.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';
import '../../../services/general_services.dart';
import '../controllers/case_details_controller.dart';

class CaseGeneralDetailsWidget extends GetView<CaseDetailsController> {
  const CaseGeneralDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            Strings.generalDetails,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 20.h),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                flex: 1,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customDetailsItem(
                          icon: ImagePaths.path79,
                          title: Strings.caseNumber,
                          value: controller.cases.caseNumber ?? Strings.na),
                      SizedBox(height: 20.h),
                      customDetailsItem(
                          icon: ImagePaths.documentLayout,
                          title: Strings.type,
                          value: controller.cases.type != null
                              ? GeneralServices.getKeyFromValue(
                                  Constants.caseTypesMap,
                                  controller.cases.type!)
                              : Strings.na)
                    ])),
            Expanded(
                flex: 1,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customDetailsItem(
                          icon: ImagePaths.deleteCalendar,
                          title: Strings.dateSubmitted,
                          value: controller.cases.submittedOn != null
                              ? intl.DateFormat('EEE d MMM y')
                                  .format(controller.cases.submittedOn!)
                                  .toString()
                              : Strings.na),
                      SizedBox(height: 20.h),
                      customDetailsItem(
                          icon: ImagePaths.import,
                          title: Strings.priority,
                          value: controller.cases.priority != null
                              ? GeneralServices.getKeyFromValue(
                                  Constants.casePriorityMap,
                                  controller.cases.priority!)
                              : Strings.na)
                    ]))
          ])
        ]));
  }
}

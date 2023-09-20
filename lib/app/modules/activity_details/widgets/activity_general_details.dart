import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import '../../../../common/constants.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';
import '../../../services/general_services.dart';
import '../controllers/activity_details_controller.dart';

class ActivityGeneralDetailsWidget extends GetView<ActivityDetailsController> {
  const ActivityGeneralDetailsWidget({Key? key}) : super(key: key);

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
                child: customDetailsItem(
                    icon: ImagePaths.deleteCalendar,
                    title: Strings.date,
                    value: controller.fitOutStep.createdOn != null
                        ? intl.DateFormat('EEE d MMM y')
                            .format(controller.fitOutStep.createdOn!)
                            .toString()
                        : Strings.na)),
            Expanded(
                flex: 1,
                child: customDetailsItem(
                    icon: ImagePaths.pylon,
                    title: Strings.status,
                    value: controller.fitOutStep.status != null
                        ? GeneralServices.getKeyFromValue(
                            Constants.fitOuTStepsTypesMap,
                            controller.fitOutStep.status!)
                        : Strings.na))
          ])
        ]));
  }
}

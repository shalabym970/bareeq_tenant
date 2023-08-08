import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';
import '../controllers/work_permit_details_controller.dart';

class WorkPermitWorkStatusWidget extends GetView<WorkPermitDetailsController> {
  const WorkPermitWorkStatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.workStatus,
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
                      icon: ImagePaths.filingTime,
                      title: Strings.startDate,
                      value:  controller.workPermit.startDate == null
                          ? Strings.na
                          : DateFormat("yyyy-MM-dd")
                          .format(controller.workPermit.startDate!),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    customDetailsItem(
                        icon: ImagePaths.workers,
                        title: Strings.numberOfWorkers,
                        value: controller.workPermit.numberOfWorkers.toString())
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customDetailsItem(
                        icon: ImagePaths.filingTime,
                        title: Strings.endDate,
                        value: controller.workPermit.endDate == null
                            ?  Strings.na
                            : DateFormat("yyyy-MM-dd")
                                .format(controller.workPermit.endDate!)),
                    SizedBox(
                      height: 20.h,
                    ),
                    customDetailsItem(
                        icon: ImagePaths.pylon,
                        title: Strings.status,
                        value:  controller.workPermit.statusCode.toString())
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

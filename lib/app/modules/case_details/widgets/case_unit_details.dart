import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';
import '../controllers/case_details_controller.dart';

class CaseUnitDetailsWidget extends GetView<CaseDetailsController> {
  const CaseUnitDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.unitDetails,
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
                        icon: ImagePaths.office,
                        title: Strings.property,
                        value: controller.cases.relatedProject!.name
                            .toString()),
                    SizedBox(
                      height: 20.h,
                    ),
                    customDetailsItem(
                        icon: ImagePaths.group77,
                        title: Strings.relatedLease,
                        // TODO: must get the lease name by this id whene back at project any more
                        value:
                            controller.cases.propertyLeaseId.toString())
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customDetailsItem(
                        icon: ImagePaths.group42,
                        title: Strings.unit,
                        value: controller.cases.unit!.name.toString()),
                    SizedBox(
                      height: 20.h,
                    ),
                    customDetailsItem(
                        icon: ImagePaths.pylon,
                        title: Strings.status,
                        // TODO: must be to convert this status to string to show him here in the future
                        value: controller.cases.status.toString())
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

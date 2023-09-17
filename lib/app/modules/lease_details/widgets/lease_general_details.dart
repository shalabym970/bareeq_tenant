import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../../common/constants.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';
import '../../../services/general_services.dart';
import '../controllers/lease_details_controller.dart';

class LeaseGeneralDetailsWidget extends GetView<LeaseDetailsController> {
  const LeaseGeneralDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(Strings.generalDetails,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400)),
          SizedBox(height: 20.h),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                flex: 1,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customDetailsItem(
                          icon: ImagePaths.path79,
                          title: Strings.leaseCRMNumber,
                          value: controller.lease.crmLeaseNumber ?? Strings.na),
                      SizedBox(height: 20.h),
                      customDetailsItem(
                          icon: ImagePaths.deleteCalendar,
                          title: Strings.contractPeriod,
                          value: controller.lease.contractPeriod != null
                              ? controller.lease.contractPeriod.toString()
                              : Strings.na)
                    ])),
            Expanded(
                flex: 1,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customDetailsItem(
                          icon: ImagePaths.documentLayout,
                          title: Strings.type,
                          value: GeneralServices.getKeyFromValue(
                              Constants.leaseTypeMap,
                              controller.lease.type ?? 0)),
                      SizedBox(height: 20.h),
                      customDetailsItem(
                          icon: ImagePaths.pylon,
                          title: Strings.status,
                          value: GeneralServices.getKeyFromValue(
                              Constants.leaseStatusMap,
                              controller.lease.status ?? 0))
                    ]))
          ])
        ]));
  }
}

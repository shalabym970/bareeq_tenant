import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/constants.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';
import '../../dashboard/controllers/dashboard_controller.dart';
import '../controllers/work_permit_details_controller.dart';

class WorkPermitGeneralDetailsWidget
    extends GetView<WorkPermitDetailsController> {
  const WorkPermitGeneralDetailsWidget({Key? key}) : super(key: key);

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
                          icon: ImagePaths.group42,
                          title: Strings.unit,
                          value: controller.workPermit.relatedUnit!.name ??
                              Strings.na),
                      SizedBox(height: 20.h),
                      customDetailsItem(
                          icon: ImagePaths.documentLayout,
                          title: Strings.type,
                          value: controller.workPermit.type == true
                              ? Constants.emergency
                              : Constants.standard)
                    ])),
            Expanded(
                flex: 1,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customDetailsItem(
                          icon: ImagePaths.manager,
                          title: Strings.contractor,
                          value: controller.workPermit.contractor!.name ??
                              Strings.na),
                      SizedBox(height: 20.h),
                      customDetailsItem(
                          icon: ImagePaths.shirt,
                          title: Strings.customer,
                          value: Get.find<DashboardController>()
                                  .currentUser
                                  .account!
                                  .name ??
                              Strings.na)
                    ]))
          ])
        ]));
  }
}

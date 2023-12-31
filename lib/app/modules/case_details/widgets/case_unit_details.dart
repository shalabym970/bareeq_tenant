import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../../common/constants.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';
import '../../../services/general_services.dart';
import '../controllers/case_details_controller.dart';

class CaseUnitDetailsWidget extends GetView<CaseDetailsController> {
  const CaseUnitDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(Strings.unitDetails,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400)),
          SizedBox(height: 20.h),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                flex: 1,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customDetailsItem(
                          icon: ImagePaths.office,
                          title: Strings.property,
                          value: controller.cases.property?.name ?? Strings.na),
                      SizedBox(height: 20.h),
                      customDetailsItem(
                          icon: ImagePaths.group77,
                          title: Strings.relatedContract,
                          value: controller.cases.relatedProperty?.name ??
                              Strings.na)
                    ])),
            Expanded(
                flex: 1,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customDetailsItem(
                          icon: ImagePaths.group42,
                          title: Strings.unit,
                          value: controller.cases.unit?.name ?? Strings.na),
                      SizedBox(height: 20.h),
                      customDetailsItem(
                          icon: ImagePaths.pylon,
                          title: Strings.natureOfComplaint,
                          value: controller.cases.natureOfComplaint != null
                              ? GeneralServices.getKeyFromValue(
                                  Constants.natureOfComplaints,
                                  controller.cases.natureOfComplaint!)
                              : Strings.na)
                    ]))
          ])
        ]));
  }
}

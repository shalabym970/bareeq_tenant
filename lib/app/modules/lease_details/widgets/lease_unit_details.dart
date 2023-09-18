import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';
import '../controllers/lease_details_controller.dart';

class LeaseUnitDetailsWidget extends GetView<LeaseDetailsController> {
  const LeaseUnitDetailsWidget({Key? key}) : super(key: key);

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
                          value: controller.lease.property?.name ?? Strings.na),
                      SizedBox(
                        height: 20.h,
                      ),
                      customDetailsItem(
                          icon: ImagePaths.priceTage,
                          title: Strings.brand,
                          value: controller.lease.brand!.name ?? Strings.na)
                    ])),
            Expanded(
                flex: 1,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customDetailsItem(
                          icon: ImagePaths.group42,
                          title: Strings.unit,
                          value: controller.lease.unit?.name ?? Strings.na),
                      SizedBox(
                        height: 20.h,
                      ),
                      customDetailsItem(
                          icon: ImagePaths.path79,
                          title: Strings.propertyERPNumber,
                          value: controller.lease.erpLeaseNumber != null
                              ? controller.lease.erpLeaseNumber.toString()
                              : Strings.na)
                    ]))
          ])
        ]));
  }
}

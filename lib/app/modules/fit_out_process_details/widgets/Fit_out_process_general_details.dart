import 'package:Bareeq/app/services/general_services.dart';
import 'package:Bareeq/common/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';
import '../controllers/fit_out_process_details_controller.dart';

class FitOutProcessGeneralDetailsWidget
    extends GetView<FitOutProcessDetailsController> {
  const FitOutProcessGeneralDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            Strings.generalDetails,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                flex: 1,
                child: customDetailsItem(
                    icon: ImagePaths.office,
                    title: Strings.property,
                    value: controller.fitOut.property!.name ?? Strings.na)),
            Expanded(
                flex: 1,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customDetailsItem(
                          icon: ImagePaths.group42,
                          title: Strings.unit,
                          value: controller.fitOut.unit!.name ?? Strings.na),
                      SizedBox(height: 10.h),
                      customDetailsItem(
                          icon: ImagePaths.pylon,
                          title: Strings.status,
                          value: GeneralServices.getKeyFromValue(
                              Constants.fitOuTTypesMap,
                              controller.fitOut.status ?? 0))
                    ]))
          ])
        ]));
  }
}

import 'package:Seef/app/modules/dashboard/controllers/dashboard_controller.dart';
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
                child: customDetailsItem(
                    icon: ImagePaths.office,
                    title: Strings.property,
                    value: controller.fitOut.property!.name.toString()),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customDetailsItem(
                        icon: ImagePaths.group42,
                        title: Strings.unit,
                        value: controller.fitOut.unit!.name.toString()),
                    SizedBox(
                      height: 20.h,
                    ),
                    customDetailsItem(
                      icon: ImagePaths.pylon,
                      title: Strings.status,
                      value: Get.find<DashboardController>()
                          .fitOutStatus(statusNo: controller.fitOut.status!),
                    )
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

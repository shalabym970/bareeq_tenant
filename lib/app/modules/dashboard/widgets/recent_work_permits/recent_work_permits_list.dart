import 'package:Bareeq/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:Bareeq/app/modules/dashboard/widgets/recent_work_permits/work_permits_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/strings/strings.dart';
import '../../../../../common/widgets/dashboard_shimmer.dart';
import '../../../../../common/widgets/empty_list_widget.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../../../models/work_permit.dart';

class RecentWorkPermitsList extends GetView<DashboardController> {
  const RecentWorkPermitsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Obx(
          () => controller.loadingWorkPermits.isTrue
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: ShimmerWidget.rectangular(height: 50.h),
                )
              : controller.errorWorkPermits.isTrue
                  ? CustomErrorWidget(
                      iconWidth: 20.w,
                      iconHeight: 20.h,
                      fontSize: 15.sp,
                    )
                  : controller.workPermits.isEmpty
                      ? const EmptyListWidget(message: Strings.workPermitsEmpty)
                      : ListView.builder(
                          padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: controller.workPermits.length > 3
                              ? 3
                              : controller.workPermits.length,
                          itemBuilder: ((_, index) {
                            WorkPermit workPermit =
                                controller.workPermits.elementAt(index);

                            return WorkPermitItem(workPermit: workPermit);
                          }),
                        ),
        ));
  }
}

import 'package:Bareeq/app/modules/dashboard/widgets/recent_work_permits/work_permits_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../../common/widgets/empty_list_widget.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../../../../common/widgets/vertical_list_loading.dart';
import '../../../../models/work_permit.dart';
import '../../../dashboard/controllers/dashboard_controller.dart';

class WorkPermitsList extends GetView<DashboardController> {
  const WorkPermitsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Obx(
          () => controller.loadingWorkPermits.isTrue
              ? VerticalListLoading(
                  height: 62.h,
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
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: controller.workPermits.length,
                          itemBuilder: ((_, index) {
                            WorkPermitModel workPermit =
                                controller.workPermits.elementAt(index);
                            return WorkPermitItem(workPermit: workPermit);
                          }),
                        ),
        ));
  }
}

import 'package:bareeq/app/models/fit_out_model.dart';
import 'package:bareeq/app/modules/dashboard/widgets/recent_fit_out_processes/fit_out_processes_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../../common/widgets/dashboard_shimmer.dart';
import '../../../../../common/widgets/empty_list_widget.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../controllers/dashboard_controller.dart';

class RecentFitOutProcessesList extends GetView<DashboardController> {
  const RecentFitOutProcessesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Obx(() => controller.loadingOutProcess.isTrue
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: ShimmerWidget.rectangular(height: 100.h),
              )
            : controller.errorOutProcess.isTrue
                ? CustomErrorWidget(
                    iconWidth: 20.w,
                    iconHeight: 20.h,
                    fontSize: 15.sp,
                  )
                : controller.fitOuts.isEmpty
                    ? SizedBox(
                        height: 0.1.sh,
                        child: const EmptyListWidget(
                            message: Strings.fitOutsEmpty))
                    : ListView.builder(
                        padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                        primary: false,
                        shrinkWrap: true,
                        itemCount: controller.fitOuts.length > 2
                            ? 2
                            : controller.fitOuts.length,
                        itemBuilder: ((_, index) {
                          FitOutModel fitOut =
                              controller.fitOuts.elementAt(index);

                          return FitOutProcessesListItem(fitOut: fitOut);
                        }))));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../../common/widgets/empty_list_widget.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../../../../common/widgets/vertical_list_loading.dart';
import '../../../../models/fit_out_model.dart';
import '../../../dashboard/controllers/dashboard_controller.dart';
import '../../../dashboard/widgets/recent_fit_out_processes/fit_out_processes_list_item.dart';

class FitOutsList extends GetView<DashboardController> {
  const FitOutsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Obx(
          () => controller.loadingOutProcess.isTrue
              ? VerticalListLoading(height: 100.h)
              : controller.errorOutProcess.isTrue
                  ? CustomErrorWidget(
                      iconWidth: 20.w,
                      iconHeight: 20.h,
                      fontSize: 15.sp,
                    )
                  : controller.fitOuts.isEmpty
                      ? EmptyListWidget(
                          fontSize: 15.sp, message: Strings.fitOutsEmpty)
                      : ListView.builder(
                          padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: controller.fitOuts.length,
                          itemBuilder: ((_, index) {
                            FitOutModel fitOut =
                                controller.fitOuts.elementAt(index);

                            return FitOutProcessesListItem(
                              fitOut: fitOut,
                            );
                          }),
                        ),
        ));
  }
}

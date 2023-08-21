import 'package:Bareeq/app/models/lease_model.dart';
import 'package:Bareeq/app/modules/dashboard/widgets/recent_leases/leases_list_item.dart';
import 'package:Bareeq/common/widgets/vertical_list_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../../common/widgets/dashboard_shimmer.dart';
import '../../../../../common/widgets/empty_list_widget.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../controllers/dashboard_controller.dart';

class RecentLeasesList extends GetView<DashboardController> {
  const RecentLeasesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Obx(
          () => controller.loadingLeases.isTrue
              ? Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: ShimmerWidget.rectangular(height: 100.h),
          )
              : controller.errorLeases.isTrue
                  ? CustomErrorWidget(
                      iconWidth: 20.w,
                      iconHeight: 20.h,
                      fontSize: 15.sp,
                    )
                  : controller.leases.isEmpty
                      ? EmptyListWidget(
                          fontSize: 15.sp, message: Strings.leasesEmpty)
                      : ListView.builder(
                          padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: controller.leases.length > 2
                              ? 2
                              : controller.leases.length,
                          itemBuilder: ((_, index) {
                            LeaseModel lease =
                                controller.leases.elementAt(index);
                            return LeasesListItem(lease: lease);
                          }),
                        ),
        ));
  }
}

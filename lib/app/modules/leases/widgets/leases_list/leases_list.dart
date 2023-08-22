import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../../common/widgets/empty_list_widget.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../../../../common/widgets/vertical_list_loading.dart';
import '../../../../models/lease_model.dart';
import '../../../dashboard/controllers/dashboard_controller.dart';
import '../../../dashboard/widgets/recent_leases/leases_list_item.dart';

class LeasesList extends GetView<DashboardController> {
  const LeasesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Obx(
          () => controller.loadingLeases.isTrue
              ? VerticalListLoading(height: 100.h)
              : controller.errorLeases.isTrue
                  ? CustomErrorWidget(
                      iconWidth: 20.w,
                      iconHeight: 20.h,
                      fontSize: 15.sp,
                    )
                  : controller.leases.isEmpty
                      ? const EmptyListWidget(message: Strings.leasesEmpty)
                      : ListView.builder(
                          padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: controller.leases.length,
                          itemBuilder: ((_, index) {
                            LeaseModel lease =
                                controller.leases.elementAt(index);
                            return LeasesListItem(lease: lease);
                          }),
                        ),
        ));
  }
}

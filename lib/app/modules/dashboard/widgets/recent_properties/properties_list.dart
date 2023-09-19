import 'package:bareeq/app/models/leased_property.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../../common/widgets/dashboard_shimmer.dart';
import '../../../../../common/widgets/empty_list_widget.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../controllers/dashboard_controller.dart';
import 'leases_list_item.dart';

class RecentPropertiesList extends GetView<DashboardController> {
  const RecentPropertiesList({super.key});

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
                      ? SizedBox(
                          height: 0.1.sh,
                          child: const EmptyListWidget(
                              message: Strings.propertiesEmpty))
                      : ListView.builder(
                          padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: controller.leases.length > 2
                              ? 2
                              : controller.leases.length,
                          itemBuilder: ((_, index) {
                            LeasedProperty lease =
                                controller.leases.elementAt(index);
                            return PropertyListItem(lease: lease);
                          }),
                        ),
        ));
  }
}

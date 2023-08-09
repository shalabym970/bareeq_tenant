import 'package:Seef/app/modules/dashboard/widgets/recent_cases/recent_cases_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../../common/widgets/dashboard_shimmer.dart';
import '../../../../../common/widgets/empty_list_widget.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../../../models/case_model.dart';
import '../../controllers/dashboard_controller.dart';

class RecentCasesList extends GetView<DashboardController> {
  const RecentCasesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Obx(
          () => controller.loadingCases.isTrue
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: ShimmerWidget.rectangular(height: 100.h),
                )
              : controller.errorCases.isTrue
                  ? CustomErrorWidget(
                      iconWidth: 20.w,
                      iconHeight: 20.h,
                      fontSize: 15.sp,
                    )
                  : controller.cases.isEmpty
                      ? EmptyListWidget(
                          fontSize: 15.sp, message: Strings.casesEmpty)
                      : ListView.builder(
                          padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: controller.cases.length > 2
                              ? 2
                              : controller.cases.length,
                          itemBuilder: ((_, index) {
                            Case cases = controller.cases.elementAt(index);
                            return RecentCasesListItem(cases: cases);
                          }),
                        ),
        ));
  }
}
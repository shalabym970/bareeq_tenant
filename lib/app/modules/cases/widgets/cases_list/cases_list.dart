import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../../common/widgets/empty_list_widget.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../../../../common/widgets/vertical_list_loading.dart';
import '../../../../models/case_model.dart';
import '../../../dashboard/controllers/dashboard_controller.dart';
import '../../../dashboard/widgets/recent_cases/cases_item.dart';

class CasesList extends GetView<DashboardController> {
  const CasesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Obx(
          () => controller.loadingCases.isTrue
              ? VerticalListLoading(height: 100.h)
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
                          itemCount: controller.cases.length,
                          itemBuilder: ((_, index) {
                            Case cases = controller.cases.elementAt(index);
                            return CasesListItem(cases: cases);
                          }),
                        ),
        ));
  }
}

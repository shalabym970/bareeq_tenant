import 'package:Bareeq/app/models/fit_out_step_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../../common/widgets/empty_list_widget.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../../../../common/widgets/horizontal_list_loading.dart';
import '../../controllers/fit_out_process_details_controller.dart';
import 'Fit_out_step_item.dart';

class FitOutProcessStepsList extends GetView<FitOutProcessDetailsController> {
  const FitOutProcessStepsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Obx(
          () => controller.loadingFitOutSteps.isTrue
              ? const HorizontalListLoading()
              : controller.errorFitOutSteps.isTrue
                  ? CustomErrorWidget(
                      iconWidth: 20.w,
                      iconHeight: 20.h,
                      fontSize: 15.sp,
                    )
                  : controller.messages.isEmpty
                      ? const Center(
                          child: EmptyListWidget(
                              message: Strings.nothingFitOutSteps))
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: controller.fitOutSteps.length,
                          itemBuilder: ((_, index) {
                            FitOutStepModel step =
                                controller.fitOutSteps.elementAt(index);
                            return FitOutStepItem(fitOutStep: step);
                          }),
                        ),
        ));
  }
}

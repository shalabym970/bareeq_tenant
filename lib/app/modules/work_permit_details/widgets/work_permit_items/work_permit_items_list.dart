import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../../common/widgets/empty_list_widget.dart';
import 'work_permit_item_card.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../../../../common/widgets/horizontal_list_loading.dart';
import '../../../../models/work_permit_item.dart';
import '../../controllers/work_permit_details_controller.dart';

class WorkPermitsItemsList extends GetView<WorkPermitDetailsController> {
  const WorkPermitsItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Obx(
          () => controller.loadingWorkPermitItems.isTrue
              ? const HorizontalListLoading()
              : controller.errorWorkPermitItems.isTrue
                  ? CustomErrorWidget(
                      iconWidth: 20.w,
                      iconHeight: 20.h,
                      fontSize: 15.sp,
                    )
                  : controller.workPermitItems.isEmpty
                      ? const Center(
                          child:
                              EmptyListWidget(message: Strings.nothingMessages))
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: controller.workPermitItems.length,
                          itemBuilder: ((_, index) {
                            WorkPermit workPermitItem =
                                controller.workPermitItems.elementAt(index);
                            return WorkPermitItemCard(
                              workPermitItem: workPermitItem,
                            );
                          }),
                        ),
        ));
  }
}

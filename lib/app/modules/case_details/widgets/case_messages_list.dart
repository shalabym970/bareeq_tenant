import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_message_card.dart';
import '../../../../common/widgets/dashboard_shimmer.dart';
import '../../../../common/widgets/empty_list_widget.dart';
import '../../../../common/widgets/error_widget.dart';
import '../../../models/message.dart';
import '../controllers/case_details_controller.dart';

class CaseMessagesList extends GetView<CaseDetailsController> {
  const CaseMessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.errorMessages.isTrue
        ? CustomErrorWidget(
            iconWidth: 20.w,
            iconHeight: 20.h,
            fontSize: 15.sp,
          )
        : controller.loadingMessages.isTrue
            ? ShimmerWidget.rectangular(
                height: 100.h,
                width: 155.w,
              )
            : controller.messages.isEmpty
                ? Center(
                    child: EmptyListWidget(
                        fontSize: 12.sp, message: Strings.nothingMessages))
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    primary: false,
                    shrinkWrap: true,
                    itemCount: controller.messages.length,
                    itemBuilder: ((_, index) {
                      MessageModel message = controller.messages.elementAt(index);
                      return CustomMessageCard(message: message);
                    }),
                  ));
  }
}

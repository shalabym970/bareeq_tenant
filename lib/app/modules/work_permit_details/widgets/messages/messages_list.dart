import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../models/message.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../../../../common/widgets/horizontal_list_loading.dart';
import '../../controllers/work_permit_details_controller.dart';
import 'message_card.dart';

class MessagesList extends GetView<WorkPermitDetailsController> {
  const MessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Obx(
          () => controller.errorMessages.isTrue
              ? CustomErrorWidget(
                  iconWidth: 20.w,
                  iconHeight: 20.h,
                  fontSize: 15.sp,
                )
              : controller.loadingWorkPermitItems.isTrue
                  ? const HorizontalListLoading()
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      primary: false,
                      shrinkWrap: true,
                      itemCount: controller.messages.length,
                      itemBuilder: ((_, index) {
                        MessageModel message = controller.messages.elementAt(index);
                        return MessageCard(
                          message: message,
                        );
                      }),
                    ),
        ));
  }
}

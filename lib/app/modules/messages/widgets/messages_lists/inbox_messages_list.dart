import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../../common/widgets/empty_list_widget.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../../../../common/widgets/vertical_list_loading.dart';
import '../../../../models/message.dart';
import '../../controllers/messages_controller.dart';
import '../message_list_item.dart';

class InboxMessagesList extends GetView<MessagesController> {
  const InboxMessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
        child: Obx(
          () => controller.loading.isTrue
              ? VerticalListLoading(height: 120.h)
              : controller.error.isTrue
                  ? CustomErrorWidget(
                      iconWidth: 20.w,
                      iconHeight: 20.h,
                      fontSize: 15.sp,
                    )
                  : controller.inboxMessages.isEmpty
                      ? const EmptyListWidget(message: Strings.nothingMessages)
                      : ListView.builder(
                          padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: controller.inboxMessages.length,
                          itemBuilder: ((_, index) {
                            MessageModel message =
                                controller.inboxMessages.elementAt(index);

                            return MessageListItem(
                              message: message,
                            );
                          }),
                        ),
        ));
  }
}
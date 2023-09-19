import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/constants.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../../common/widgets/empty_list_widget.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../../../../common/widgets/vertical_list_loading.dart';
import '../../../../models/message.dart';
import '../../../../routes/app_routes.dart';
import '../../controllers/messages_controller.dart';
import '../message_list_item.dart';

class SentMessagesList extends GetView<MessagesController> {
  const SentMessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
        child: Obx(() => controller.loading.isTrue
            ? VerticalListLoading(height: 120.h)
            : controller.error.isTrue
                ? CustomErrorWidget(
                    iconWidth: 20.w, iconHeight: 20.h, fontSize: 15.sp)
                : controller.sentMessages.isEmpty
                    ? SizedBox(
                        height: 0.5.sh,
                        child: const EmptyListWidget(
                            message: Strings.nothingMessages))
                    : ListView.builder(
                        padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                        primary: false,
                        shrinkWrap: true,
                        itemCount: controller.sentMessages.length,
                        itemBuilder: ((_, index) {
                          MessageModel message =
                              controller.sentMessages.elementAt(index);
                          return GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.messagesDetails, arguments: [
                                  message.direction == true
                                      ? Constants.sentMessage
                                      : Constants.inboxMessage,
                                  message
                                ])?.then((value) => controller.getMessages());
                              },
                              child: MessageListItem(message: message));
                        }))));
  }
}

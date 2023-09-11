import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../../common/widgets/custom_attachment_widget.dart';
import '../../../../../common/widgets/dashboard_shimmer.dart';
import '../../../../../common/widgets/empty_list_widget.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../../../models/attachment.dart';
import '../../controllers/message_details_controller.dart';

class MessageAttachmentsList extends GetView<MessageDetailsController> {
  const MessageAttachmentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => controller.loadingAttachments.isTrue
                  ? Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: ShimmerWidget.rectangular(height: 50.h))
                  : controller.errorAttachments.isTrue
                      ? CustomErrorWidget(iconWidth: 20.w, iconHeight: 20.h)
                      : controller.attachments.isEmpty
                          ? const Center(
                              child: EmptyListWidget(
                                  message: Strings.nothingAttachments))
                          : ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              primary: false,
                              shrinkWrap: true,
                              itemCount: controller.attachments.length,
                              itemBuilder: ((_, index) {
                                Attachment attachment =
                                    controller.attachments.elementAt(index);
                                return CustomAttachmentWidget(
                                    attachment: attachment);
                              })))
            ]));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/dashboard_shimmer.dart';
import '../../../../common/widgets/dynamic_attachment_widget.dart';
import '../../../../common/widgets/error_widget.dart';
import '../../../../common/widgets/upload_file_widget.dart';
import '../../../models/attachment.dart';
import '../../work_permit_details/widgets/attachments/work_permit_uploaded_attachment_widget.dart';
import '../controllers/sold_property_details_controller.dart';

class SoldPropertyAttachment extends GetView<SoldPropertyDetailsController> {
  const SoldPropertyAttachment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Obx(() => controller.loadingAttachments.isTrue
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: ShimmerWidget.rectangular(height: 50.h))
            : controller.errorAttachments.isTrue
                ? CustomErrorWidget(iconWidth: 20.w, iconHeight: 20.h)
                : controller.downloadedAttachments.isEmpty &&
                        controller.attachFile.value == null
                    ? InkWell(
                        onTap: () {
                          controller.selectFile();
                        },
                        child: const UploadFileWidget())
                    : controller.attachFile.value == null
                        ? ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            primary: false,
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: ((_, index) {
                              Attachment attachment =
                                  controller.downloadedAttachments.first;
                              return DynamicAttachmentWidget(
                                  attachment: attachment,
                                  onDelete: () {
                                    controller.deleteAttachment(
                                        attachment: attachment);
                                  });
                            }),
                          )
                        : WorkPermitUploadedAttachmentWidget(
                            file: controller.attachFile.value!,
                            onPressedCancel: () =>
                                controller.attachFile.value = null,
                            onReplace: () => controller.selectFile())));
  }
}

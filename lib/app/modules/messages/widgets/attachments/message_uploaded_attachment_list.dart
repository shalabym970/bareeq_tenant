import 'package:Bareeq/common/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../../../../../common/strings/strings.dart';
import '../../../../../common/widgets/empty_list_widget.dart';
import '../../../../../common/widgets/uploaded_attachment_widget.dart';
import '../../controllers/message_details_controller.dart';

class MessageUploadedAttachmentsList extends GetView<MessageDetailsController> {
  const MessageUploadedAttachmentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Obx(
          () => controller.uploadedFiles.isNotEmpty
              ? Column(children: <Widget>[
                  Divider(
                      height: 5.h, thickness: 1.h, color: ColorManager.black),
                  SizedBox(height: 10.h),
                  ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      primary: false,
                      shrinkWrap: true,
                      itemCount: controller.uploadedFiles.length,
                      itemBuilder: ((_, index) {
                        File file = controller.uploadedFiles.elementAt(index);
                        return UploadedAttachmentWidget(
                            file: file,
                            onPressedCancel: () =>
                                controller.deleteSelectedFile(index: index));
                      }))
                ])
              :  const Center(
              child: EmptyListWidget(
                  message: Strings.nothingAttachments)),
        ));
  }
}

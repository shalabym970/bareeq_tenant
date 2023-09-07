import 'package:Bareeq/common/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../../common/widgets/dashboard_shimmer.dart';
import '../../../../../common/widgets/empty_list_widget.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../../../models/document.dart';
import '../../controllers/case_details_controller.dart';
import 'case_attachment_widget.dart';
import 'dart:io';

import '../../../../../common/widgets/uploaded_attachment_widget.dart';

class CaseAttachmentsList extends GetView<CaseDetailsController> {
  const CaseAttachmentsList({Key? key}) : super(key: key);

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
                                return CaseAttachmentWidget(
                                    attachment: attachment);
                              }))),
              Obx(
                () => controller.uploadedFiles.isNotEmpty
                    ? Column(children: <Widget>[
                        Divider(
                            height: 5.h,
                            thickness: 1.h,
                            color: ColorManager.black),
                        SizedBox(height: 10.h),
                        ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            primary: false,
                            shrinkWrap: true,
                            itemCount: controller.uploadedFiles.length,
                            itemBuilder: ((_, index) {
                              File file =
                                  controller.uploadedFiles.elementAt(index);
                              return UploadedAttachmentWidget(
                                  file: file,
                                  onPressedCancel: () => controller
                                      .deleteSelectedFile(index: index));
                            }))
                      ])
                    : Container(),
              )
            ]));
  }
}

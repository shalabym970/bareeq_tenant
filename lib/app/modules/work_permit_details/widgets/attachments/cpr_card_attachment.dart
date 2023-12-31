import 'package:bareeq/app/modules/work_permit_details/widgets/attachments/work_permit_attachment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/constants.dart';
import '../../../../../common/widgets/dashboard_shimmer.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../../../../common/widgets/upload_file_widget.dart';
import '../../../../models/attachment.dart';
import 'work_permit_uploaded_attachment_widget.dart';
import '../../controllers/work_permit_details_controller.dart';

class CprCardAttachment extends GetView<WorkPermitDetailsController> {
  const CprCardAttachment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Constants.workPermitCprCardsAttachment,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400)),
              Obx(() => controller.loadingCprAttach.isTrue
                  ? Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: ShimmerWidget.rectangular(height: 50.h))
                  : controller.errorCprAttach.isTrue
                      ? CustomErrorWidget(iconWidth: 20.w, iconHeight: 20.h)
                      : controller.cprAttach.isEmpty &&
                              controller.cprFile.value == null
                          ? InkWell(
                              onTap: () {
                                controller.selectFile(
                                    fileType: Constants.cprFile);
                              },
                              child: const UploadFileWidget())
                          : controller.cprFile.value == null
                              ? ListView.builder(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: 1,
                                  itemBuilder: ((_, index) {
                                    Attachment attachment =
                                        controller.cprAttach.first;
                                    return WorkPermitAttachmentWidget(
                                        attachment: attachment,
                                        fileType: Constants.cprFile);
                                  }),
                                )
                              : WorkPermitUploadedAttachmentWidget(
                                  file: controller.cprFile.value!,
                                  onPressedCancel: () =>
                                      controller.cprFile.value = null,
                                  onReplace: () => controller.selectFile(
                                      fileType: Constants.cprFile)))
            ]));
  }
}

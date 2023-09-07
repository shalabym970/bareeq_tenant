import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/constants.dart';
import '../../../../../common/widgets/upload_file_widget.dart';
import '../../controllers/create_work_permit_controller.dart';
import '../../../work_permit_details/widgets/attachments/work_permit_uploaded_attachment_widget.dart';

class AddRiskAssessmentAttachment extends GetView<CreateWorkPermitController> {
  const AddRiskAssessmentAttachment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Constants.workPermitRiskAssessmentAttachment,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400)),
              Obx(() => controller.riskFile.value == null
                  ? InkWell(
                      onTap: () {
                        controller.selectFile(fileType: Constants.riskFile);
                      },
                      child: const UploadFileWidget())
                  : WorkPermitUploadedAttachmentWidget(
                      file: controller.riskFile.value!,
                      onPressedCancel: () => controller.riskFile.value = null,
                      onReplace: () =>
                          controller.selectFile(fileType: Constants.riskFile)))
            ]));
  }
}

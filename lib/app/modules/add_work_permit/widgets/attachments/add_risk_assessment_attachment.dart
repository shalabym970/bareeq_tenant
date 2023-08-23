import 'package:Bareeq/app/modules/work_permit_details/widgets/attachments/work_permit_attachment_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/constants.dart';
import '../../../../../common/widgets/dashboard_shimmer.dart';
import '../../../../../common/widgets/upload_file_widget.dart';
import '../../controllers/add_work_permit_controller.dart';

class AddRiskAssessmentAttachment extends GetView<AddWorkPermitController> {
  const AddRiskAssessmentAttachment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Constants.workPermitRiskAssessmentAttachment,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400)),
            Obx(() => controller.loadingRiskAttach.isTrue
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: ShimmerWidget.rectangular(height: 50.h))
                : controller.riskAttach.value.filename == null
                    ? const UploadFileWidget()
                    : WorkPermitAttachmentWidget(
                        attachment: controller.riskAttach.value)),
          ],
        ));
  }
}

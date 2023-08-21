import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/constants.dart';
import '../../../../common/widgets/custom_attachment_widget.dart';
import '../../../../common/widgets/dashboard_shimmer.dart';
import '../../../../common/widgets/error_widget.dart';
import '../../../../common/widgets/upload_file_widget.dart';
import '../controllers/work_permit_details_controller.dart';

class WorkPermitAttachmentsWidget extends GetView<WorkPermitDetailsController> {
  const WorkPermitAttachmentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: Text(Constants.workPermitCprCardsAttachment,
                style:
                    TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400))),
        Obx(() => controller.loadingCprAttach.isTrue
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: ShimmerWidget.rectangular(height: 50.h))
            : controller.errorCprAttach.isTrue
                ? CustomErrorWidget(
                    iconWidth: 20.w, iconHeight: 20.h, fontSize: 15.sp)
                : controller.cprAttach.value.id == null
                    ? const UploadFileWidget()
                    : CustomAttachmentWidget(
                        attachment: controller.cprAttach.value)),
        SizedBox(height: 5.h),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: Text(Constants.workPermitInsuranceAttachment,
                style:
                    TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400))),
        Obx(() => controller.loadingInsuranceAttach.isTrue
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: ShimmerWidget.rectangular(height: 50.h))
            : controller.errorInsuranceAttach.isTrue
                ? CustomErrorWidget(
                    iconWidth: 20.w, iconHeight: 20.h, fontSize: 15.sp)
                : controller.insuranceAttach.value.id == null
                    ?const UploadFileWidget()
                    : CustomAttachmentWidget(
                        attachment: controller.insuranceAttach.value)),
        SizedBox(height: 5.h),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: Text(Constants.workPermitMethodStatementAttachment,
                style:
                    TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400))),
        Obx(() => controller.loadingMethodAttach.isTrue
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: ShimmerWidget.rectangular(height: 50.h))
            : controller.errorMethodAttach.isTrue
                ? CustomErrorWidget(
                    iconWidth: 20.w, iconHeight: 20.h, fontSize: 15.sp)
                : controller.methodAttach.value.id == null
                    ? const UploadFileWidget()
                    : CustomAttachmentWidget(
                        attachment: controller.methodAttach.value)),
        SizedBox(height: 5.h),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: Text(Constants.workPermitRiskAssessmentAttachment,
                style:
                    TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400))),
        Obx(() => controller.loadingRiskAttach.isTrue
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: ShimmerWidget.rectangular(height: 50.h))
            : controller.errorRiskAttach.isTrue
                ? CustomErrorWidget(
                    iconWidth: 20.w, iconHeight: 20.h, fontSize: 15.sp)
                : controller.riskAttach.value.id == null
                    ? const UploadFileWidget()
                    : CustomAttachmentWidget(
                        attachment: controller.riskAttach.value))
      ],
    );
  }
}

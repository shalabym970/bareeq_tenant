import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/color_manager.dart';
import '../../../../../common/constants.dart';
import '../../../../../common/widgets/custom_attachment_widget.dart';
import '../../../../../common/widgets/dashboard_shimmer.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../../../../common/widgets/upload_file_widget.dart';
import '../../../../models/document.dart';
import '../../controllers/work_permit_details_controller.dart';

class InsuranceAttachment extends GetView<WorkPermitDetailsController> {
  const InsuranceAttachment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Constants.workPermitInsuranceAttachment,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400)),
            Obx(
              () => controller.loadingInsuranceAttach.isTrue
                  ? Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: ShimmerWidget.rectangular(height: 50.h))
                  : controller.errorInsuranceAttach.isTrue
                      ? CustomErrorWidget(iconWidth: 20.w, iconHeight: 20.h)
                      : controller.insuranceAttach.isEmpty
                          ? const UploadFileWidget()
                          : ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              primary: false,
                              shrinkWrap: true,
                              itemCount: 1,
                              itemBuilder: ((_, index) {
                                Attachment attachment =
                                    controller.insuranceAttach.elementAt(index);
                                return CustomAttachmentWidget(
                                    attachment: attachment);
                              }),
                            ),
            ),
          ],
        ));
  }
}

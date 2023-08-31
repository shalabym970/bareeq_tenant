import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/constants.dart';
import '../../../../../common/widgets/upload_file_widget.dart';
import '../../controllers/add_work_permit_controller.dart';
import '../../../../../common/widgets/uploaded_attachment_widget.dart';

class AddInsuranceAttachment extends GetView<AddWorkPermitController> {
  const AddInsuranceAttachment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Constants.workPermitInsuranceAttachment,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400)),
              Obx(() => controller.insuranceFile.value == null
                  ? InkWell(
                      onTap: () {
                        controller.selectFile(
                            fileType: Constants.insuranceFile);
                      },
                      child: const UploadFileWidget())
                  : UploadedAttachmentWidget(
                      file: controller.insuranceFile.value!,
                      onPressedCancel: () => controller.insuranceFile.value = null,
                      onReplace: () => controller.selectFile(
                          fileType: Constants.insuranceFile))),
            ]));
  }
}

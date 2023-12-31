import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/constants.dart';
import '../../../../../common/widgets/upload_file_widget.dart';
import '../../controllers/create_work_permit_controller.dart';
import '../../../work_permit_details/widgets/attachments/work_permit_uploaded_attachment_widget.dart';

class AddCprCardAttachment extends GetView<CreateWorkPermitController> {
  const AddCprCardAttachment({Key? key}) : super(key: key);

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
              Obx(() => controller.cprFile.value == null
                  ? InkWell(
                      onTap: () {
                        controller.selectFile(fileType: Constants.cprFile);
                      },
                      child: const UploadFileWidget())
                  : WorkPermitUploadedAttachmentWidget(
                      file: controller.cprFile.value!,
                      onPressedCancel: () => controller.cprFile.value = null,
                      onReplace: () =>
                          controller.selectFile(fileType: Constants.cprFile)))
            ]));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/constants.dart';
import '../../../../../common/widgets/dashboard_shimmer.dart';
import '../../../../../common/widgets/upload_file_widget.dart';
import '../../../../services/attachment_services.dart';
import '../../controllers/add_work_permit_controller.dart';
import '../../../../../common/widgets/uploaded_attachment_widget.dart';

class AddMethodStatementAttachment extends GetView<AddWorkPermitController> {
  const AddMethodStatementAttachment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Constants.workPermitMethodStatementAttachment,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400)),
            Obx(() => controller.methodFile.value == null
                ? InkWell(
                    onTap: () {
                      controller.selectFile(fileType: Constants.methodFile);
                    },
                    child: const UploadFileWidget())
                : UploadedAttachmentWidget(
                    file: controller.methodFile.value!,
                    onPressedCancel: () => controller.methodFile.value = null, onReplace: () =>Constants.methodFile
                  )),
          ],
        ));
  }
}

import 'package:Bareeq/app/models/document.dart';
import 'package:Bareeq/app/modules/work_permit_details/controllers/work_permit_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../common/color_manager.dart';
import '../../../../../common/images_paths.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../../common/widgets/ui.dart';
import '../../../../services/attachment_services.dart';
import '../../controllers/case_details_controller.dart';

class CaseAttachmentWidget extends GetView<CaseDetailsController> {
  const CaseAttachmentWidget({Key? key, this.attachment}) : super(key: key);
  final Attachment? attachment;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: Column(children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.h)),
                ),
                height: 62.h,
                child: Card(
                    color: ColorManager.textFieldBg,
                    child: Padding(
                        padding: EdgeInsets.all(10.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(ImagePaths.document,
                                  height: 24.h, width: 21.w),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Strings.fileName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.sp,
                                          color: ColorManager.mainColor),
                                    ),
                                    Text(
                                      attachment?.filename ?? "",
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.black.withOpacity(0.7)),
                                      maxLines: 1,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: 32.h,
                                  width: 32.w,
                                  child: FloatingActionButton(
                                      backgroundColor: ColorManager.mainColor,
                                      onPressed: () {
                                        AttachmentServices.downloadBase64File(
                                            fileName:
                                                attachment!.filename.toString(),
                                            mimeType:
                                                attachment!.mimeType.toString(),
                                            base64String: attachment!
                                                .documentBody
                                                .toString());
                                      },
                                      child: SvgPicture.asset(
                                          ImagePaths.download,
                                          height: 12.h,
                                          width: 12.w)))
                            ])))),
            SizedBox(height: 5.h),
            Align(
                alignment: Alignment.centerRight,
                child: Text("${attachment!.fileSize! ~/ 1024} KB",
                    style: TextStyle(
                        fontSize: 12.sp, color: Colors.black.withOpacity(0.7))))
          ])),
      Positioned(
          top: -15,
          left: -15,
          child: IconButton(
              icon: Icon(
                Icons.cancel,
                color: Colors.red,
                size: 20.sp,
              ),
              onPressed: () {
                Ui.confirmDialog(
                    middleText: Strings.deleteAttachmentDiscreption,
                    confirmBtnTitle: Strings.delete,
                    onSave: () {
                      controller.deleteAttachment(attachment: attachment!);
                    },
                    onDiscard: () {
                      Get.back();
                    },
                    title: Strings.delete);
              }))
    ]);
  }
}

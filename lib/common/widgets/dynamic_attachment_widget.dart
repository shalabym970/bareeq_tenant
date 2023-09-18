import 'package:bareeq/app/models/attachment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../color_manager.dart';
import '../images_paths.dart';
import '../strings/strings.dart';
import 'ui.dart';
import '../../app/services/attachment_services.dart';

class DynamicAttachmentWidget extends StatelessWidget {
  const DynamicAttachmentWidget(
      {Key? key, this.attachment, required this.onDelete})
      : super(key: key);
  final Attachment? attachment;
  final void Function() onDelete;

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
                              Expanded(
                                  child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  Strings.fileName,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10.sp,
                                                      color: ColorManager
                                                          .mainColor),
                                                ),
                                                Text(
                                                    attachment?.filename ??
                                                        Strings.na,
                                                    style: TextStyle(
                                                        fontSize: 10.sp,
                                                        color: Colors.black
                                                            .withOpacity(0.7)),
                                                    maxLines: 1)
                                              ])))),
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
                    onSave: onDelete,
                    onDiscard: () {
                      Get.back();
                    },
                    title: Strings.delete);
              }))
    ]);
  }
}

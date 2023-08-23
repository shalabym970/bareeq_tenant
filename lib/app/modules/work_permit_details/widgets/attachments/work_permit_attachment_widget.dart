import 'package:Bareeq/app/models/document.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../common/color_manager.dart';
import '../../../../../common/images_paths.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../services/attachment_services.dart';

class WorkPermitAttachmentWidget extends StatelessWidget {
  const WorkPermitAttachmentWidget({Key? key, this.attachment})
      : super(key: key);
  final Attachment? attachment;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Column(children: [
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
                onTap: () {},
                child: Icon(Icons.change_circle_sharp,
                    size: 25.sp, color: ColorManager.mainColor)),
          ),
          SizedBox(
            height: 5.h,
          ),
          GestureDetector(
              onTap: () async {
                AttachmentServices.downloadBase64File(
                    fileName: attachment!.filename.toString(),
                    mimeType: attachment!.mimeType.toString(),
                    base64String: attachment!.documentBody.toString());
              },
              child: Container(
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
                              onPressed: () {},
                              child: SvgPicture.asset(ImagePaths.download,
                                  height: 12.h, width: 12.w)),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          SizedBox(
            height: 5.h,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text("${attachment!.fileSize! ~/ 1024} KB",
                style: TextStyle(
                    fontSize: 12.sp, color: Colors.black.withOpacity(0.7))),
          )
        ]));
  }
}
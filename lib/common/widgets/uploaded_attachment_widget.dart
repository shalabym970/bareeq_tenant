import 'dart:io';
import 'package:Bareeq/app/services/attachment_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart' as path;
import '../color_manager.dart';
import '../images_paths.dart';
import '../strings/strings.dart';

class UploadedAttachmentWidget extends StatelessWidget {
  const UploadedAttachmentWidget(
      {Key? key,
      required this.file,
      required this.onPressedCancel,
      required this.onReplace})
      : super(key: key);
  final File file;
  final void Function()? onPressedCancel;
  final void Function()? onReplace;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(children: [
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
              onTap: onReplace,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.change_circle_sharp,
                      size: 25.sp, color: ColorManager.mainColor),
                  SizedBox(width: 5.w),
                  Text(Strings.replace,
                      style: TextStyle(
                          fontSize: 12.sp, color: ColorManager.mainColor))
                ],
              )),
        ),
        SizedBox(
          height: 5.h,
        ),
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
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(ImagePaths.document,
                                    height: 24.h, width: 21.w),
                                SizedBox(width: 20.w),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        Strings.fileName,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                            color: ColorManager.mainColor),
                                      ),
                                      Text(path.basename(file.path),
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              color: Colors.black
                                                  .withOpacity(0.7)),
                                          maxLines: 1)
                                    ]),
                              ]),
                          SvgPicture.asset(ImagePaths.upload,
                              color: ColorManager.mainColor,
                              height: 20.h,
                              width: 20.w)
                        ])))),
        SizedBox(height: 5.h),
        Align(
          alignment: Alignment.centerRight,
          child: FutureBuilder<double>(
            future: AttachmentServices.getFileSizeInMB(file: file),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(
                  color: ColorManager.mainColor,
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}',
                    style: TextStyle(
                        fontSize: 12.sp, color: Colors.black.withOpacity(0.7)));
              } else {
                double fileSize = snapshot.data ?? 0.0;
                return Text('${fileSize.toStringAsFixed(2)} MB',
                    style: TextStyle(
                        fontSize: 12.sp, color: Colors.black.withOpacity(0.7)));
              }
            },
          ),
        )
      ]),
      Positioned(
        top: 10,
        left: -15,
        child: IconButton(
          icon: Icon(
            Icons.cancel,
            color: Colors.red,
            size: 20.sp,
          ),
          onPressed: onPressedCancel,
        ),
      ),
    ]);
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart' as path;
import '../../../../../common/color_manager.dart';
import '../../../../../common/images_paths.dart';
import '../../../../../common/strings/strings.dart';

class AddedAttachmentWidget extends StatelessWidget {
  const AddedAttachmentWidget({Key? key, required this.file}) : super(key: key);
  final File file;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(ImagePaths.document,
                            height: 24.h, width: 21.w),
                        SizedBox(width: 20.w),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                      color: Colors.black.withOpacity(0.7)),
                                  maxLines: 1)
                            ])
                      ])))),
      SizedBox(
        height: 5.h,
      ),
      // Align(
      //   alignment: Alignment.centerRight,
      //   child: Text("${attachment!.fileSize! ~/ 1024} KB",
      //       style: TextStyle(
      //           fontSize: 12.sp, color: Colors.black.withOpacity(0.7))),
      // )
    ]);
  }
}

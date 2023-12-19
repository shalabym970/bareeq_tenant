import 'package:bareeq/common/color_manager.dart';
import 'package:bareeq/common/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadFileWidget extends StatelessWidget {
  const UploadFileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Column(children: [
                  Icon(
                    Icons.upload_file_rounded,
                    color: ColorManager.grey,
                    size: 25.sp,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(Strings.selectFile,
                      style: TextStyle(
                          color: ColorManager.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                          decoration: TextDecoration.underline))
                ])));
  }
}
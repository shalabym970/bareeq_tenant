import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../color_manager.dart';
import '../images_paths.dart';
import '../strings.dart';

class CustomAttachmentWidget extends StatelessWidget {
  const CustomAttachmentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
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
                              color: ColorManager.darkBlue),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text('Wooden tables infrastructure',
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black.withOpacity(0.7)))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                    width: 32.w,
                    child: FloatingActionButton(
                        onPressed: () {},
                        heroTag: null,
                        backgroundColor: ColorManager.primaryBTNColorBrown,
                        child: SvgPicture.asset(ImagePaths.path66,
                            height: 12.h, width: 12.w)),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

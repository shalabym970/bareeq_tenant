import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/images_paths.dart';
import '../../../../../common/strings/strings.dart';
import 'fit_outs_list.dart';

class FitOutsListWidget extends StatelessWidget {
  const FitOutsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(6.h),
                  child: SvgPicture.asset(ImagePaths.settings,
                      height: 20.h, width: 20.w),
                ),
                Padding(
                  padding: EdgeInsets.all(6.h),
                  child: Text(
                    Strings.fitOutProcesses,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          const FitOutsList()
        ],
      ),
    );
  }
}

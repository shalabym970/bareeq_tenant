import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../common/images_paths.dart';
import '../../../../../common/strings/strings.dart';
import 'leases_list.dart';

class LeasesListWidget extends StatelessWidget {
  const LeasesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(6.h),
                child: SvgPicture.asset(ImagePaths.houseDoor,
                    height: 20.h, width: 20.w)
              ),
              Padding(
                padding: EdgeInsets.all(6.h),
                child: Text(
                  Strings.properties,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)
                )
              )
            ]
          ),
          const LeasesList()
        ]
      )
    );
  }
}

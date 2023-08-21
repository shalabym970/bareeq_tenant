import 'package:Bareeq/app/modules/dashboard/widgets/recent_leases/recent_leases_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/color_manager.dart';
import '../../../../../common/images_paths.dart';
import '../../../../../common/strings/strings.dart';

class RecentLeasesWidget extends StatelessWidget {
  const RecentLeasesWidget({Key? key}) : super(key: key);

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
                    height: 20.h, width: 20.w),
              ),
              Padding(
                padding: EdgeInsets.all(6.h),
                child: Text(
                  Strings.recentLeases,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          const RecentLeasesList()
        ],
      ),
    );
  }
}

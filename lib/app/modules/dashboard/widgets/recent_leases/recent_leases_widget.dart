import 'package:bareeq/app/modules/dashboard/widgets/recent_leases/leases_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../common/images_paths.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../routes/app_routes.dart';

class RecentLeasesWidget extends StatelessWidget {
  const RecentLeasesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(children: [
          InkWell(
              onTap: () {
                Get.toNamed(Routes.leases);
              },
              child: Row(children: [
                Padding(
                    padding: EdgeInsets.all(6.h),
                    child: SvgPicture.asset(ImagePaths.houseDoor,
                        height: 20.h, width: 20.w)),
                Padding(
                    padding: EdgeInsets.all(6.h),
                    child: Text(Strings.recentProperties,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold)))
              ])),
          const RecentLeasesList()
        ]));
  }
}

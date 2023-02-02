import 'package:Seef/app/modules/dashboard/widgets/recent_work_permits/recent_work_permits_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../../../../../common/color_manager.dart';
import '../../../../../common/images_paths.dart';
import '../../../../../common/strings.dart';

class RecentWorkPermitWidget extends StatelessWidget {
  const RecentWorkPermitWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(6.h),
                    child: SvgPicture.asset(ImagePaths.briefcase,
                        height: 20.h, width: 20.w),
                  ),
                  Padding(
                    padding: EdgeInsets.all(6.h),
                    child: Text(
                      Strings.recentWorkPermits,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 32.h,
                width: 32.w,
                child: FloatingActionButton(
                  onPressed: () {},
                  heroTag: null,
                  backgroundColor: ColorManager.primaryBTNColorBrown,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),
              )
            ],
          ),
          const RecentWorkPermitsList()
        ],
      ),
    );
  }
}
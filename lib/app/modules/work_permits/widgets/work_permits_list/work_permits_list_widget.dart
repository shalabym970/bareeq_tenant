import 'package:bareeq/app/modules/work_permits/widgets/work_permits_list/work_permits_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../common/color_manager.dart';
import '../../../../../common/images_paths.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../routes/app_routes.dart';

class WorkPermitsListWidget extends StatelessWidget {
  const WorkPermitsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.h),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              Padding(
                padding: EdgeInsets.all(6.h),
                child: SvgPicture.asset(ImagePaths.briefcase,
                    height: 20.h, width: 20.w),
              ),
              Padding(
                  padding: EdgeInsets.all(6.h),
                  child: Text(Strings.workPermits,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold)))
            ]),
            SizedBox(
                height: 32.h,
                width: 32.w,
                child: FloatingActionButton(
                    onPressed: () {
                      Get.toNamed(Routes.addWorkPermit);
                    },
                    heroTag: null,
                    backgroundColor: ColorManager.mainColor,
                    child: Icon(Icons.add, color: Colors.white, size: 20.sp)))
          ]),
          const WorkPermitsList()
        ]));
  }
}
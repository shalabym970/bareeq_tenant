import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../common/color_manager.dart';
import '../../../../../common/images_paths.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../routes/app_routes.dart';
import 'cases_list.dart';

class CasesListWidget extends StatelessWidget {
  const CasesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(6.h),
                      child: SvgPicture.asset(ImagePaths.bug,
                          height: 20.h, width: 20.w),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.h),
                      child: Text(
                        Strings.cases,
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
                    onPressed: () {
                      Get.toNamed(Routes.addCase);
                    },
                    heroTag: null,
                    backgroundColor: ColorManager.mainColor,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                )
              ],
            ),
          ),
          const CasesList()
        ],
      ),
    );
  }
}

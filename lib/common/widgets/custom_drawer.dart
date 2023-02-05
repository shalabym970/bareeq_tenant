import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../app/routes/app_routes.dart';
import '../color_manager.dart';
import '../images_paths.dart';
import '../strings.dart';
import 'drawer_item_widget.dart';

Drawer customDrawer() {
  return Drawer(
    backgroundColor: ColorManager.darkBlue,
    child: Stack(
      children: <Widget>[
        SvgPicture.asset(
          ImagePaths.drawerBg,
          alignment: Alignment.center,
          width: Get.width,
          height: 637.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  BackButton(
                    color: ColorManager.white,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    Strings.menu,
                    style: TextStyle(
                        color: ColorManager.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 23.sp),
                  )
                ],
              ),
              SizedBox(height: 50.w),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DrawerItemWidget(
                      text: Strings.workPermits,
                      svgIconPath: ImagePaths.whiteBriefcase,
                      onTap: () {
                        Get.toNamed(Routes.workPermits);
                      },
                    ),
                    SizedBox(height: 40.h),
                    DrawerItemWidget(
                      text: Strings.cases,
                      svgIconPath: ImagePaths.whiteBug,
                      onTap: () {
                        Get.toNamed(Routes.cases);
                      },
                    ),
                    SizedBox(height: 40.h),
                    DrawerItemWidget(
                      text: Strings.fitOutProcesses,
                      svgIconPath: ImagePaths.whiteSettings,
                      onTap: () {
                        Get.toNamed(Routes.fitOuts);
                      },
                    ),
                    SizedBox(height: 40.h),
                    DrawerItemWidget(
                      text: Strings.invoices,
                      svgIconPath: ImagePaths.whiteReceipt,
                      onTap: () {
                        Get.toNamed(Routes.invoices);
                      },
                    ),
                    SizedBox(height: 40.h),
                    DrawerItemWidget(
                      text: Strings.leases,
                      svgIconPath: ImagePaths.whiteHouse,
                      onTap: () {
                        Get.toNamed(Routes.leases);
                      },
                    ),
                    SizedBox(height: 80.h),
                    DrawerItemWidget(
                      text: Strings.logout,
                      svgIconPath: ImagePaths.whiteLogout,
                      onTap: () {
                        Get.offAndToNamed(Routes.login);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

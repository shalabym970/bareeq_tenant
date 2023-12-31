import 'package:bareeq/app/helper/cash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../app/routes/app_routes.dart';
import '../color_manager.dart';
import '../images_paths.dart';
import '../strings/strings.dart';
import 'drawer_item_widget.dart';

Drawer customDrawer() {
  return Drawer(
      backgroundColor: ColorManager.mainColor,
      child: Stack(children: <Widget>[
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(ImagePaths.drawerBg,
                  alignment: Alignment.center,
                  width: Get.width,
                  height: 620.h,
                  color: ColorManager.white),
              SizedBox(height: 20.h),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(ImagePaths.logoWithoutBg,
                      height: 100.h, width: 100.h, color: ColorManager.white))
            ]),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                  Row(children: [
                    BackButton(color: ColorManager.mainColor),
                    SizedBox(width: 5.w),
                    Text(Strings.menu,
                        style: TextStyle(
                            color: ColorManager.mainColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 23.sp))
                  ]),
                  SizedBox(height: 50.w),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            DrawerItemWidget(
                                text: Strings.dashboard,
                                svgIconPath: ImagePaths.dashboard,
                                onTap: () {
                                  Get.offAllNamed(Routes.dashboard);
                                }),
                            SizedBox(height: 20.h),
                            DrawerItemWidget(
                                text: Strings.workPermits,
                                svgIconPath: ImagePaths.whiteBriefcase,
                                onTap: () {
                                  Get.toNamed(Routes.workPermits);
                                }),
                            SizedBox(height: 20.h),
                            DrawerItemWidget(
                                text: Strings.cases,
                                svgIconPath: ImagePaths.whiteBug,
                                onTap: () {
                                  Get.toNamed(Routes.cases);
                                }),
                            SizedBox(height: 20.h),
                            DrawerItemWidget(
                                text: Strings.fitOutProcesses,
                                svgIconPath: ImagePaths.whiteSettings,
                                onTap: () {
                                  Get.toNamed(Routes.fitOuts);
                                }),
                            SizedBox(height: 20.h),
                            DrawerItemWidget(
                                text: Strings.invoices,
                                svgIconPath: ImagePaths.whiteReceipt,
                                onTap: () {
                                  Get.toNamed(Routes.invoices);
                                }),
                            SizedBox(height: 20.h),
                            DrawerItemWidget(
                                text: Strings.properties,
                                svgIconPath: ImagePaths.whiteHouse,
                                onTap: () {
                                  Get.toNamed(Routes.properties);
                                }),
                            // SizedBox(height: 20.h),
                            // DrawerItemWidget(
                            //     text: Strings.help,
                            //     svgIconPath: ImagePaths.help,
                            //     onTap: () {}),
                            // SizedBox(height: 20.h),
                            // DrawerItemWidget(
                            //     text: Strings.privacyPolicy,
                            //     svgIconPath: ImagePaths.privacyPolicy,
                            //     onTap: () {}),
                            SizedBox(height: 40.h),
                            DrawerItemWidget(
                                text: Strings.logout,
                                svgIconPath: ImagePaths.whiteLogout,
                                onTap: () async {
                                  await CashHelper.clearData();
                                  Get.offAllNamed(Routes.login);
                                })
                          ]))
                ])))
      ]));
}

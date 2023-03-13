import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../routes/app_routes.dart';
import '../controllers/inquiry_controller.dart';

class InquirySentSuccessView extends GetView<InquiryController> {
  const InquirySentSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Padding(
        padding:
            EdgeInsets.only(top: 60.h, right: 15.w, left: 15.w, bottom: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40.h),
            Container(
              height: 65.h,
              width: 50.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(70.h)),
                  color: Colors.green),
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 60.h,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                Strings.inquirySentSuccessfully,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: ColorManager.black),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                Strings.inquirySentString,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: ColorManager.black),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 35.h),
            PrimaryButton(
                title: Strings.backLogin,
                onPressed: () {
                  Get.offAllNamed(Routes.login);
                },
                height: 40.h,
                backgroundColor: ColorManager.darkGreen,
                textAndIconColor: ColorManager.white),
            SizedBox(height: 35.h),
          ],
        ),
      ),
    );
  }
}

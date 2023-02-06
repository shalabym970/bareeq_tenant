import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../controllers/auth_controller.dart';

class RecoverAccountView extends GetView<AuthController> {
  const RecoverAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.darkBlue,
        title: Text(
          Strings.recoverPassword,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              color: ColorManager.white),
        ),
        leading: BackButton(
          color: ColorManager.white, // <-- SEE HERE
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(top: 30.h, right: 15.w, left: 15.w, bottom: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              Strings.recoverAccountTitle,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17.sp,
                  color: ColorManager.black),
            ),
            SizedBox(height: 32.h),
            Form(
              key: controller.recoverFormKey,
              child: Column(
                children: [
                  Column(
                    children: [
                      CustomTextField(
                          hint: Strings.email,
                          controller: controller.recoverEmailController,
                          labelWidget: Text(Strings.email,
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.darkBlue))),
                      SizedBox(height: 50.h),
                      PrimaryButton(
                          title: Strings.resetPassword,
                          onPressed: () {
                            Get.back();
                          },
                          height: 40.h,
                          backgroundColor: ColorManager.primaryBTNColorBrown,
                          textAndIconColor: ColorManager.white),
                      SizedBox(height: 50.h),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          Strings.backLogin,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: ColorManager.darkBlue,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.solid),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

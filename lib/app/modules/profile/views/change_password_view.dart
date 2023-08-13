import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../controllers/profile_controller.dart';

class ChangePasswordView extends GetView<ProfileController> {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: Strings.changePassword,
          svgProfileIcon: ImagePaths.profileBrown),

      body: Padding(
        padding: EdgeInsets.only(right: 10.w, left: 10.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: Text(
                  Strings.youAreChangePass,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 40.h),
              CustomTextField(
                hint: Strings.enterCurrentPass,
                controller: controller.currentPassController,
                labelWidget: Text(
                  Strings.currentPassword,
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.mainColor),
                ),
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                hint: Strings.enterNewPass,
                controller: controller.newPassController,
                labelWidget: Text(
                  Strings.newPass,
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.mainColor),
                ),
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                hint: Strings.enterNewPassAgain,
                controller: controller.confirmPassController,
                labelWidget: Text(
                  Strings.confirmPassword,
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.mainColor),
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(height: 40.h),
              PrimaryButton(
                title: Strings.changePassword,
                onPressed: () {},
                height: 40.h,
                backgroundColor: ColorManager.mainColor,
                textAndIconColor: ColorManager.white,
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),

      drawer:
          customDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

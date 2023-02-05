import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../routes/app_routes.dart';
import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: 60.h, right: 15.w, left: 15.w, bottom: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              Image.asset(
                ImagePaths.logo,
                height: 77.h,
                width: Get.width,
              ),
              SizedBox(height: 75.h),
              Center(
                child: Text(
                  Strings.login,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp,
                      color: ColorManager.darkBlue),
                ),
              ),
              SizedBox(height: 32.h),
              Form(
                key: controller.loginFormKey,
                child: Column(
                  children: [
                    Column(
                      children: [
                        CustomTextField(
                          hint: Strings.email,
                          controller: controller.emailController,
                        ),
                        SizedBox(height: 45.h),
                        CustomTextField(
                          hint: Strings.password,
                          controller: controller.emailController,
                        ),
                        SizedBox(height: 22.h),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            Strings.forgotPass,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                                color: ColorManager.darkBlue,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                        SizedBox(height: 40.h),
                        PrimaryButton(
                            title: Strings.login,
                            onPressed: () {
                              Get.offAndToNamed(Routes.dashboard);
                            },
                            height: 40.h, backgroundColor: ColorManager.primaryBTNColorBrown, textAndIconColor: ColorManager.white),
                        SizedBox(height: 40.h),
                        Text(
                          Strings.noHaveAccount,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: ColorManager.black,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          Strings.createInquiry,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: ColorManager.darkBlue,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.solid),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

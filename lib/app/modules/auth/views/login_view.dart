import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
                ImagePaths.logoWithoutBg,
                height: 50.h,
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
                          validator:(value) => value!.isEmpty
                              ? 'Please enter some text'
                              : null,
                        ),
                        SizedBox(height: 45.h),
                        Obx(() => CustomTextField(
                              hint: Strings.password,
                              controller: controller.passwordController,
                              obscureText: controller.passwordVisible.value,
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter some text'
                                  : null,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.passwordVisible.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: ColorManager.darkBlue,
                                  size: 20.sp,
                                ),
                                onPressed: () {
                                  controller.passwordVisible.value =
                                      !controller.passwordVisible.value;
                                },
                              ),
                            )),
                        SizedBox(height: 22.h),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.passwordRecovering);
                          },
                          child: Align(
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
                        ),
                        SizedBox(height: 40.h),
                        PrimaryButton(
                            title: Strings.login,
                            onPressed: () {
                             // controller.login();
                              Get.offAllNamed(Routes.dashboard);
                            },
                            height: 40.h,
                            backgroundColor: ColorManager.primaryBTNColorBrown,
                            textAndIconColor: ColorManager.white),
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
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.createInquiry);
                          },
                          child: Text(
                            Strings.createInquiry,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
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
      ),
    );
  }
}

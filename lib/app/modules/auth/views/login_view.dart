import 'package:Seef/common/widgets/first_custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
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
            mainAxisAlignment: controller.loading.isTrue
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Image.asset(
                ImagePaths.logoWithoutBg,
                height: 150.h,
                width: Get.width,
              ),
              SizedBox(height: 50.h),
              Center(
                child: Text(
                  Strings.login,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp,
                      color: ColorManager.mainColor),
                ),
              ),
              SizedBox(height: 32.h),
              Obx(() => controller.loading.isTrue
                  ? const Center(
                      child: FirstCustomLoading(),
                    )
                  : Form(
                      key: controller.loginFormKey,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              CustomTextField(
                                hint: Strings.email,
                                controller: controller.emailController,
                                validator: (value) => value!.isEmpty
                                    ? 'Please enter some text'
                                    : null,
                                maxLines: 1,
                              ),
                              SizedBox(height: 45.h),
                              Obx(() => CustomTextField(
                                    hint: Strings.password,
                                    controller: controller.passwordController,
                                    obscureText:
                                        controller.passwordVisible.value,
                                    validator: (value) => value!.isEmpty
                                        ? 'Please enter some text'
                                        : null,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        controller.passwordVisible.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: ColorManager.mainColor,
                                        size: 20.sp,
                                      ),
                                      onPressed: () {
                                        controller.passwordVisible.value =
                                            !controller.passwordVisible.value;
                                      },
                                    ),
                                    maxLines: 1,
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
                                        color: ColorManager.mainColor,
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ),
                              SizedBox(height: 40.h),
                              PrimaryButton(
                                  title: Strings.login,
                                  onPressed: () {
                                    controller.login();
                                  },
                                  height: 40.h,
                                  backgroundColor: ColorManager.mainColor,
                                  textAndIconColor: ColorManager.white),
                            ],
                          ),
                        ],
                      ),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}

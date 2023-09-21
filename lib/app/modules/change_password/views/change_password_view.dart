import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_details_app_bar.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../../common/widgets/label_text_field.dart';
import '../../../../common/widgets/no_internet_connection_widget.dart';
import '../../../../common/widgets/second_custom_loading.dart';
import '../../../services/session_services.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.connectionController.isConnected.isTrue
        ? Scaffold(
            appBar: customDetailsAppBar(title: Strings.changePassword),
            body: Stack(children: [
              GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Padding(
                      padding: EdgeInsets.only(right: 10.w, left: 10.w),
                      child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                            SizedBox(height: 20.h),
                            Center(
                                child: Text(Strings.youAreChangePass,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold))),
                            SizedBox(height: 40.h),
                            Form(
                                key: controller.changePasswordKey,
                                child: Column(children: [
                                  Obx(() => CustomTextField(
                                      hint: Strings.enterCurrentPass,
                                      controller:
                                          controller.currentPassController,
                                      validator: (value) => value!.isEmpty
                                          ? ErrorStrings.enterCurrentPassword
                                          : value !=
                                                  Get.find<SessionServices>()
                                                      .currentUser
                                                      .value
                                                      .password
                                              ? ErrorStrings.notMatchPass
                                              : null,
                                      obscureText: controller
                                          .currentPasswordVisible.value,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          controller
                                                  .currentPasswordVisible.value
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: ColorManager.mainColor,
                                          size: 20.sp,
                                        ),
                                        onPressed: () {
                                          controller.currentPasswordVisible
                                                  .value =
                                              !controller
                                                  .currentPasswordVisible.value;
                                        },
                                      ),
                                      labelWidget: const LabelTextField(
                                          label: Strings.currentPassword,
                                          isRequired: true))),
                                  SizedBox(height: 20.h),
                                  Obx(() => CustomTextField(
                                      hint: Strings.enterNewPass,
                                      controller: controller.newPassController,
                                      validator: (value) => value!.isEmpty
                                          ? ErrorStrings.enterNewPassword
                                          : value ==
                                                  Get.find<SessionServices>()
                                                      .currentUser
                                                      .value
                                                      .password
                                              ? ErrorStrings
                                                  .cannotEnterSameCurrentPass
                                              : value.length < 8
                                                  ? ErrorStrings
                                                      .cannotEnterPassLessThen8Character
                                                  : null,
                                      obscureText:
                                          controller.newPasswordVisible.value,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          controller.newPasswordVisible.value
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: ColorManager.mainColor,
                                          size: 20.sp,
                                        ),
                                        onPressed: () {
                                          controller.newPasswordVisible.value =
                                              !controller
                                                  .newPasswordVisible.value;
                                        },
                                      ),
                                      maxLines: 1,
                                      labelWidget: const LabelTextField(
                                          label: Strings.newPass,
                                          isRequired: true))),
                                  SizedBox(height: 20.h),
                                  Obx(() => CustomTextField(
                                      hint: Strings.enterNewPassAgain,
                                      controller:
                                          controller.confirmPassController,
                                      validator: (value) => value!.isEmpty
                                          ? ErrorStrings.enterConfirmationPass
                                          : value !=
                                                  controller
                                                      .newPassController.text
                                              ? ErrorStrings
                                                  .enterCorrectConfirmationPass
                                              : null,
                                      obscureText:
                                          controller.newPasswordVisible.value,
                                      labelWidget: const LabelTextField(
                                          label: Strings.confirmPassword,
                                          isRequired: true))),
                                ])),
                            SizedBox(height: 50.h),
                            PrimaryButton(
                                title: Strings.changePassword,
                                onPressed: () {
                                  controller.changePassword();
                                },
                                height: 40.h,
                                width: 0.5.sw,
                                backgroundColor: ColorManager.mainColor,
                                textAndIconColor: ColorManager.white),
                            SizedBox(height: 40.h)
                          ])))),
              Obx(() => Visibility(
                  visible: controller.changePassLoading.isTrue ? true : false,
                  child: const Opacity(
                      opacity: 0.8,
                      child: ModalBarrier(
                          dismissible: false, color: Colors.black)))),
              Obx(() => Visibility(
                  visible: controller.changePassLoading.isTrue ? true : false,
                  child: const Center(child: SecondCustomLoading())))
            ]),
          )
        : const NoInternetConnectionView());
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../../common/widgets/second_custom_loading.dart';
import '../../../services/general_services.dart';
import '../controllers/auth_controller.dart';

class RecoverAccountView extends GetView<AuthController> {
  const RecoverAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          controller.recoverEmailController.clear();
          Get.back();
          return false;
        },
        child: Stack(children: [
          Scaffold(
              backgroundColor: ColorManager.white,
              appBar: AppBar(
                  backgroundColor: ColorManager.mainColor,
                  title: Text(Strings.recoverPassword,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                          color: ColorManager.white)),
                  leading: BackButton(color: ColorManager.white // <-- SEE HERE
                  )),
              body: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 30.h, right: 15.w, left: 15.w, bottom: 10.h),
                      child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(Strings.recoverAccountTitle,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17.sp,
                                        color: ColorManager.black)),
                                SizedBox(height: 32.h),
                                Form(
                                    key: controller.recoverFormKey,
                                    child: CustomTextField(
                                        hint: Strings.email,
                                        controller:
                                        controller.recoverEmailController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return ErrorStrings.enterEmail;
                                          } else if (!GeneralServices.isEmailValid(
                                              value)) {
                                            return ErrorStrings.enterValidEmail;
                                          }
                                          return null; // Return null to indicate no validation error
                                        },
                                        maxLines: 1,
                                        labelWidget: Text(Strings.email,
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w500,
                                                color: ColorManager.mainColor)))),
                                SizedBox(height: 50.h),
                                PrimaryButton(
                                    title: Strings.resetPassword,
                                    onPressed: () {
                                      controller.recoverAccount();
                                    },
                                    height: 40.h,
                                    backgroundColor: ColorManager.mainColor,
                                    textAndIconColor: ColorManager.white),
                                SizedBox(height: 50.h),
                                GestureDetector(
                                    onTap: () {
                                      controller.recoverEmailController.clear();
                                      Get.back();
                                    },
                                    child: Text(Strings.backLogin,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                            color: ColorManager.mainColor,
                                            decoration: TextDecoration.underline,
                                            decorationStyle:
                                            TextDecorationStyle.solid)))
                              ]))))),
          Obx(() => Visibility(
              visible: controller.loadingRecoverAccount.isTrue ? true : false,
              child: const Opacity(
                  opacity: 0.8,
                  child:
                  ModalBarrier(dismissible: false, color: Colors.black)))),
          Obx(() => Visibility(
              visible: controller.loadingRecoverAccount.isTrue ? true : false,
              child: const Center(child: SecondCustomLoading())))
        ]));
  }
}
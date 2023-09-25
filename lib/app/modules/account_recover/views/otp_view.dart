import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/no_internet_connection_widget.dart';
import '../../../../common/widgets/second_custom_loading.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.connectionController.isConnected.isTrue
        ? WillPopScope(
            onWillPop: () async {
              controller.otpController.clear();
              Get.back();
              return false;
            },
            child: Stack(children: [
              Scaffold(
                  backgroundColor: ColorManager.white,
                  appBar: AppBar(
                      backgroundColor: ColorManager.mainColor,
                      title: Text(Strings.verificationCode,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                              color: ColorManager.white)),
                      leading:
                          BackButton(color: ColorManager.white // <-- SEE HERE
                              )),
                  body: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                      },
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                SizedBox(height: 25.h),
                                Text(Strings.enterVerificationCode,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17.sp,
                                        color: ColorManager.black),
                                    textAlign: TextAlign.center),
                                SizedBox(height: 32.h),
                                Container(
                                    height: 120.h,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: OTPTextField(
                                            length: 6,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            controller:
                                                controller.otpController,
                                            fieldWidth: 30.w,
                                            style: TextStyle(fontSize: 20.sp),
                                            textFieldAlignment:
                                                MainAxisAlignment.spaceAround,
                                            fieldStyle: FieldStyle.underline,
                                            onCompleted: (pin) {
                                             controller.verificationOtp(pin:pin);
                                            }))),
                                Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                        Strings.ifYouDidNotReceivedACode,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: ColorManager.darkGrey,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp))),
                                SizedBox(height: 20.h),
                                Align(
                                    alignment: Alignment.center,
                                    child: Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: Obx(() => CountdownTimer(
                                            endTime: controller.endTime.value,
                                            textStyle: TextStyle(
                                                color: ColorManager.mainColor,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600),
                                            endWidget: Center(
                                                child: GestureDetector(
                                                    onTap: () async {
                                                      controller.resendOtp();
                                                    },
                                                    child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(Strings.resend,
                                                              style: TextStyle(
                                                                  color: ColorManager
                                                                      .mainColor,
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                          Icon(
                                                            Icons.refresh,
                                                            color: ColorManager
                                                                .mainColor,
                                                          )
                                                        ]))))))),
                              ]))))),
              Obx(() => Visibility(
                  visible: controller.loadingSendingOtp.isTrue ? true : false,
                  child: const Opacity(
                      opacity: 0.8,
                      child: ModalBarrier(
                          dismissible: false, color: Colors.black)))),
              Obx(() => Visibility(
                  visible: controller.loadingSendingOtp.isTrue ? true : false,
                  child: const Center(child: SecondCustomLoading())))
            ]))
        : const NoInternetConnectionView());
  }
}

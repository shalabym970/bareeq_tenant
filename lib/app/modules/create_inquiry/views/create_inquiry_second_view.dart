import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_dropdown.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../controllers/inquiry_controller.dart';
import 'inquiry_sent_successfully.dart';

class CreateInquirySecondView extends GetView<InquiryController> {
  const CreateInquirySecondView({super.key});

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
              SizedBox(height: 40.h),
              SvgPicture.asset(ImagePaths.magazin, height: 75.h, width: 75.w),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  Strings.defineYourUnit,
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
                  Strings.inquirySecondString,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: ColorManager.black),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.h),
              Form(
                key: controller.inquirySecondFormKey,
                child: Column(
                  children: [
                    Column(
                      children: [
                        CustomDropDown(
                          value: controller.projectValue,
                          onChange: (String? newValue) async {},
                          items: controller.projectList.map((items) {
                            return DropdownMenuItem<String>(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          label: Strings.project,
                        ),
                        SizedBox(height: 20.h),
                        CustomDropDown(
                          value: controller.unitValue,
                          onChange: (String? newValue) async {},
                          items: controller.unitList.map((items) {
                            return DropdownMenuItem<String>(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          label: Strings.unit,
                        ),
                        SizedBox(height: 20.h),
                        CustomTextField(
                          height: 105.h,
                          hint: Strings.enterYourMessageHere,
                          controller: controller.messageController,
                          labelWidget: Text(Strings.message,
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.darkBlue)),
                          maxLines: 6,
                        ),
                        SizedBox(height: 35.h),
                        PrimaryButton(
                            title: Strings.sendInquiry,
                            onPressed: () {
                              Get.to(const InquirySentSuccessView());
                            },
                            height: 40.h,
                            backgroundColor: ColorManager.primaryBTNColorBrown,
                            textAndIconColor: ColorManager.white),
                        SizedBox(height: 35.h),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            Strings.goBack,
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

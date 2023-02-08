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
import '../../../routes/app_routes.dart';
import '../controllers/inquiry_controller.dart';
import 'create_inquiry_second_view.dart';

class CreateInquiryFirstView extends GetView<InquiryController> {
  const CreateInquiryFirstView({super.key});

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
                  Strings.areYouUnitManager,
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
                  Strings.inquiryFirstString,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: ColorManager.black),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.h),
              Form(
                key: controller.inquiryFirstFormKey,
                child: Column(
                  children: [
                    Column(
                      children: [
                        CustomTextField(
                          hint: Strings.name,
                          controller: controller.nameController,
                          labelWidget: Text(Strings.name,
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.darkBlue)),
                        ),
                        SizedBox(height: 20.h),
                        CustomTextField(
                          hint: Strings.inquiryTo,
                          controller: controller.inquiryToController,
                          labelWidget: Text(Strings.recipient,
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.darkBlue)),
                        ),
                        SizedBox(height: 20.h),
                        CustomDropDown(
                          value: controller.leadValue,
                          onChange: (String? newValue) async {},
                          items: controller.leadList.map((items) {
                            return DropdownMenuItem<String>(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          label: Strings.relatedUnit,
                        ),
                        SizedBox(height: 20.h),
                        CustomDropDown(
                          value: controller.contactValue,
                          onChange: (String? newValue) async {},
                          items: controller.contactList.map((items) {
                            return DropdownMenuItem<String>(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          label: Strings.relatedUnit,
                        ),
                        SizedBox(height: 35.h),
                        PrimaryButton(
                            title: Strings.next,
                            onPressed: () {
                              Get.to(const CreateInquirySecondView());
                            },
                            height: 40.h,
                            backgroundColor: ColorManager.primaryBTNColorBrown,
                            textAndIconColor: ColorManager.white),
                        SizedBox(height: 35.h),
                        GestureDetector(
                          onTap: () {
                            Get.offAllNamed(Routes.login);
                          },
                          child: Text(
                            Strings.backLogin,
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

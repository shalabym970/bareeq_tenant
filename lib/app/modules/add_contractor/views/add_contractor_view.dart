import 'package:Seef/common/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../controllers/add_contractor_controller.dart';

class AddContractorView extends GetView<AddContractorController> {
  const AddContractorView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
              padding: EdgeInsets.only(right: 20.w, left: 20.w),
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    const Align(
                        alignment: Alignment.topLeft, child: BackButton()),
                    Text(Strings.addContractor,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorManager.black)),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomTextField(
                        hint: Strings.companyName,
                        controller: controller.companyNameController,
                        labelWidget: Text(Strings.companyName,
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorManager.darkBlue))),
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        Expanded(
                            child: CustomTextField(
                          hint: Strings.firstName,
                          controller: controller.firstNameController,
                          labelWidget: Text(
                            Strings.firstName,
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorManager.darkBlue),
                          ),
                        )),
                        SizedBox(width: 20.w),
                        Expanded(
                            child: CustomTextField(
                          hint: Strings.lastName,
                          controller: controller.lastNameController,
                          labelWidget: Text(
                            Strings.lastName,
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorManager.darkBlue),
                          ),
                        ))
                      ],
                    ),
                    SizedBox(height: 30.h),
                    CustomTextField(
                        hint: Strings.email,
                        controller: controller.emailController,
                        labelWidget: Text(Strings.email,
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorManager.darkBlue))),
                    SizedBox(height: 30.h),
                    CustomTextField(
                        hint: Strings.phoneNumber,
                        controller: controller.phoneController,
                        labelWidget: Text(Strings.phoneNumber,
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorManager.darkBlue))),
                    SizedBox(height: 30.h),
                    PrimaryButton(
                        title: Strings.addContractor,
                        onPressed: () {},
                        height: 40.h,
                        backgroundColor: ColorManager.primaryBTNColorBrown,
                        textAndIconColor: ColorManager.white),
                    SizedBox(height: 20.h)
                  ]))),
          drawer:
              customDrawer() // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }
}

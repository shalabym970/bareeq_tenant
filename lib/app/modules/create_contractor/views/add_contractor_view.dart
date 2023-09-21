import 'package:bareeq/common/widgets/label_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_details_app_bar.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../../common/widgets/no_internet_connection_widget.dart';
import '../controllers/add_contractor_controller.dart';

class AddContractorView extends GetView<AddContractorController> {
  const AddContractorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.connectionController.isConnected.isTrue
        ? Scaffold(
            appBar: customDetailsAppBar(title: Strings.addContractor),
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20.h),
                      Form(
                          key: controller.addWorkPermitKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                  hint: Strings.companyName,
                                  controller: controller.companyNameController,
                                  validator: (value) => value!.isEmpty
                                      ? ErrorStrings.enterCompanyName
                                      : null,
                                  labelWidget: const LabelTextField(
                                      label: Strings.companyName,
                                      isRequired: true)),
                              SizedBox(height: 30.h),
                              Row(
                                children: [
                                  Expanded(
                                      child: CustomTextField(
                                          hint: Strings.firstName,
                                          controller:
                                              controller.firstNameController,
                                          validator: (value) => value!.isEmpty
                                              ? ErrorStrings.enterFirstName
                                              : null,
                                          labelWidget: const LabelTextField(
                                              label: Strings.firstName,
                                              isRequired: true))),
                                  SizedBox(width: 20.w),
                                  Expanded(
                                      child: CustomTextField(
                                          hint: Strings.lastName,
                                          controller:
                                              controller.lastNameController,
                                          validator: (value) => value!.isEmpty
                                              ? ErrorStrings.enterLastName
                                              : null,
                                          labelWidget: const LabelTextField(
                                              label: Strings.lastName,
                                              isRequired: true)))
                                ],
                              ),
                              SizedBox(height: 30.h),
                              CustomTextField(
                                  hint: Strings.email,
                                  controller: controller.emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) => value!.isEmpty
                                      ? ErrorStrings.enterEmail
                                      : null,
                                  labelWidget: const LabelTextField(
                                      label: Strings.email, isRequired: true)),
                              SizedBox(height: 30.h),
                              CustomTextField(
                                  hint: Strings.phoneNumber,
                                  controller: controller.phoneController,
                                  keyboardType: TextInputType.phone,
                                  validator: (value) => value!.isEmpty
                                      ? ErrorStrings.enterPhone
                                      : null,
                                  labelWidget: const LabelTextField(
                                      label: Strings.phoneNumber,
                                      isRequired: true)),
                            ],
                          )),
                      SizedBox(height: 30.h),
                      PrimaryButton(
                          title: Strings.addContractor,
                          onPressed: () {
                            controller.submitNewContractor();
                          },
                          height: 40.h,
                          backgroundColor: ColorManager.mainColor,
                          textAndIconColor: ColorManager.white),
                      SizedBox(height: 20.h)
                    ]))))
        : const NoInternetConnectionView());
  }
}
import 'package:Bareeq/common/widgets/label_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings/strings.dart';
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
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    const Align(
                        alignment: Alignment.topLeft, child: BackButton()),
                    Form(
                        key: controller.addWorkPermitKey,
                        child: Column(
                          children: [
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
                                validator: (value) => value!.isEmpty
                                    ? Strings.enterCompanyName
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
                                            ? Strings.enterFirstName
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
                                            ? Strings.enterLastName
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
                                validator: (value) =>
                                    value!.isEmpty ? Strings.enterEmail : null,
                                labelWidget: const LabelTextField(
                                    label: Strings.email, isRequired: true)),
                            SizedBox(height: 30.h),
                            CustomTextField(
                                hint: Strings.phoneNumber,
                                controller: controller.phoneController,
                                keyboardType: TextInputType.phone,
                                validator: (value) =>
                                    value!.isEmpty ? Strings.enterPhone : null,
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
                  ]))),
          drawer:
              customDrawer() // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }
}

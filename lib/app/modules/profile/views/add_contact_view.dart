import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../../common/widgets/label_text_field.dart';
import '../controllers/add_contact_controller.dart';

class AddContactView extends GetView<AddContactController> {
  const AddContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: Strings.newContact, svgProfileIcon: ImagePaths.profileBrown),

      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
              padding: EdgeInsets.only(right: 10.w, left: 10.w),
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    SizedBox(height: 20.h),
                    Row(children: [
                      Padding(
                          padding: EdgeInsets.all(6.h),
                          child: SvgPicture.asset(ImagePaths.employee,
                              height: 20.h, width: 20.w)),
                      Padding(
                          padding: EdgeInsets.all(6.h),
                          child: Text(Strings.addNewContact,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold)))
                    ]),
                    SizedBox(height: 20.h),
                    Form(
                        key: controller.addNewContactKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              hint: Strings.firstName,
                              controller: controller.firstNameController,
                              validator: (value) =>
                                  value!.isEmpty ? Strings.firstName : null,
                              labelWidget: const LabelTextField(
                                  label: Strings.firstName, isRequired: true),
                            ),
                            SizedBox(height: 20.h),
                            CustomTextField(
                              hint: Strings.lastName,
                              controller: controller.lastNameController,
                              validator: (value) =>
                                  value!.isEmpty ? Strings.lastName : null,
                              labelWidget: const LabelTextField(
                                  label: Strings.lastName, isRequired: true),
                            ),
                            SizedBox(height: 20.h),
                            CustomTextField(
                              hint: Strings.jobTitle,
                              controller: controller.jobTitleController,
                              validator: (value) =>
                                  value!.isEmpty ? Strings.jobTitle : null,
                              labelWidget: const LabelTextField(
                                  label: Strings.jobTitle, isRequired: true),
                            ),
                            SizedBox(height: 20.h),
                            CustomTextField(
                                hint: Strings.email,
                                controller: controller.emailController,
                                validator: (value) =>
                                    value!.isEmpty ? Strings.email : null,
                                labelWidget: const LabelTextField(
                                    label: Strings.email, isRequired: true)),
                            SizedBox(height: 20.h),
                            CustomTextField(
                                hint: Strings.phoneNumber,
                                keyboardType: TextInputType.phone,
                                controller: controller.mobileNumberController,
                                validator: (value) => value!.isEmpty
                                    ? Strings.mobileNumber
                                    : null,
                                labelWidget: const LabelTextField(
                                    label: Strings.phoneNumber,
                                    isRequired: true)),
                            SizedBox(height: 20.h),
                            CustomTextField(
                                hint: Strings.businessPhone,
                                controller: controller.businessPhoneController,
                                keyboardType: TextInputType.phone,
                                validator: (value) => value!.isEmpty
                                    ? Strings.businessPhone
                                    : null,
                                labelWidget: const LabelTextField(
                                    label: Strings.businessPhone,
                                    isRequired: true)),
                          ],
                        )),
                    SizedBox(height: 20.h),
                    PrimaryButton(
                        title: Strings.saveContact,
                        onPressed: () {
                          controller.submitNewContact();
                        },
                        height: 40.h,
                        backgroundColor: ColorManager.mainColor,
                        textAndIconColor: ColorManager.white),
                    SizedBox(height: 40.h)
                  ])))),

      drawer:
          customDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

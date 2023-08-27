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

      body: Padding(
          padding: EdgeInsets.only(right: 10.w, left: 10.w),
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                SizedBox(height: 40.h),
                Row(children: [
                  Padding(
                      padding: EdgeInsets.all(6.h),
                      child: SvgPicture.asset(ImagePaths.employee,
                          height: 20.h, width: 20.w)),
                  Padding(
                      padding: EdgeInsets.all(6.h),
                      child: Text(Strings.addNewContact,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold)))
                ]),
                SizedBox(height: 10.h),
                SizedBox(height: 20.h),
                CustomTextField(
                  hint: Strings.firstName,
                  controller: controller.firstNameController,
                  labelWidget: const LabelTextField(
                      label: Strings.firstName, isRequired: true),
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  hint: Strings.lastName,
                  controller: controller.lastNameController,
                  labelWidget: const LabelTextField(
                      label: Strings.lastName, isRequired: true),
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  hint: Strings.jobTitle,
                  controller: controller.jobTitleController,
                  labelWidget: const LabelTextField(
                      label: Strings.jobTitle, isRequired: true),
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                    hint: Strings.email,
                    controller: controller.emailController,
                    labelWidget: const LabelTextField(
                        label: Strings.email, isRequired: true)),
                SizedBox(height: 20.h),
                CustomTextField(
                    hint: Strings.phoneNumber,
                    keyboardType: TextInputType.phone,
                    controller: controller.mobileNumberController,
                    labelWidget: const LabelTextField(
                        label: Strings.phoneNumber, isRequired: true)),
                SizedBox(height: 20.h),
                CustomTextField(
                    hint: Strings.businessPhone,
                    controller: controller.businessPhoneController,
                    keyboardType: TextInputType.phone,
                    labelWidget: const LabelTextField(
                        label: Strings.businessPhone, isRequired: true)),
                SizedBox(height: 40.h),
                PrimaryButton(
                    title: Strings.saveContact,
                    onPressed: () {},
                    height: 40.h,
                    backgroundColor: ColorManager.mainColor,
                    textAndIconColor: ColorManager.white),
                SizedBox(height: 40.h)
              ]))),

      drawer:
          customDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

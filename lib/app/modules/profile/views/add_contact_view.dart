import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:property_pro/app/modules/work_permit_details/widgets/work_permit_messages_list.dart';
import 'package:property_pro/common/color_manager.dart';
import 'package:property_pro/common/images_paths.dart';
import 'package:property_pro/common/widgets/custom_text_field.dart';
import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_attachment_widget.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../routes/app_routes.dart';
import '../controllers/add_contact_controller.dart';
import '../controllers/profile_controller.dart';
import '../widgets/case_description.dart';
import '../widgets/case_general_details.dart';
import '../widgets/case_messages_list.dart';
import '../widgets/case_unit_details.dart';
import '../widgets/contacts/contacts_widget.dart';

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
              SizedBox(
                height: 40.h,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(6.h),
                    child: SvgPicture.asset(ImagePaths.employee,
                        height: 20.h, width: 20.w),
                  ),
                  Padding(
                    padding: EdgeInsets.all(6.h),
                    child: Text(
                      Strings.addNewContact,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.h),
              SizedBox(height: 20.h),
              CustomTextField(
                hint: 'First Name',
                controller: controller.firstNameController,
                labelWidget: Text(
                  Strings.firstName,
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.darkBlue),
                ),
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                hint: 'least Name',
                controller: controller.lastNameController,
                labelWidget: Text(
                  Strings.lastName,
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.darkBlue),
                ),
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                hint: 'Engineer',
                controller: controller.jobTitleController,
                labelWidget: Text(
                  Strings.jobTitle,
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.darkBlue),
                ),
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                hint: 'email',
                controller: controller.emailController,
                labelWidget: Text(
                  Strings.email,
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.darkBlue),
                ),
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                hint: '01212121212',
                controller: controller.mobileNumberController,
                labelWidget: Text(
                  Strings.mobileNumber,
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.darkBlue),
                ),
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                hint: '01212121212',
                controller: controller.businessPhoneController,
                labelWidget: Text(
                  Strings.businessPhone,
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.darkBlue),
                ),
              ),
              SizedBox(height: 40.h),
              PrimaryButton(
                title: Strings.saveContact,
                onPressed: () {
                  Get.toNamed(Routes.dashboard);
                },
                height: 40.h,
                backgroundColor: ColorManager.primaryBTNColorBrown,
                textAndIconColor: ColorManager.white,
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),

      drawer:
          CustomDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

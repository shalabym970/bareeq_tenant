import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../routes/app_routes.dart';
import '../controllers/profile_controller.dart';

import '../widgets/contacts/contacts_widget.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAndToNamed(Routes.dashboard);
        return true;
      },
      child: Scaffold(
        appBar: customAppBar(
            title: Strings.profile, svgProfileIcon: ImagePaths.profileBrown),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            heroTag: null,
            backgroundColor: ColorManager.primaryBTNColorBrown,
            child:
                SvgPicture.asset(ImagePaths.save, height: 20.h, width: 20.w)),

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
                const ContactsWidget(),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(6.h),
                      child: SvgPicture.asset(ImagePaths.bluePerson,
                          height: 20.h, width: 20.w),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.h),
                      child: Text(
                        Strings.yourProfileData,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                      hint: 'Aml',
                      controller: controller.firstNameController,
                      backgroundColor: Colors.grey[400],
                      labelWidget:  Text(Strings.firstName,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500),),
                    )),
                    SizedBox(width: 20.w),
                    Expanded(
                        child: CustomTextField(
                          hint: 'Shalaby',
                          controller: controller.lastNameController,
                          backgroundColor: Colors.grey[400],
                          labelWidget:  Text(Strings.lastName,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500),),
                        ))
                  ],
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  hint: 'Engineer',
                  controller: controller.jobTitleController,

                  labelWidget:  Text(Strings.jobTitle,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: ColorManager.darkBlue),),
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  hint: '01212121212',
                  controller: controller.mobileNumberController,

                  labelWidget:  Text(Strings.mobileNumber,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: ColorManager.darkBlue),),
                ),

                SizedBox(height: 20.h),
                CustomTextField(
                  hint: 'aml@aml.com',
                  controller: controller.emailController,
                  backgroundColor: Colors.grey[400],
                  labelWidget:  Text(Strings.email,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500),),
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  hint: 'Aml Corporate',
                  controller: controller.accountNameController,
                  backgroundColor: Colors.grey[400],
                  labelWidget:  Text(Strings.accountName,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500),),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                          hint: '10',
                          controller: controller.crNumberController,
                          labelWidget:  Text(Strings.crNumber,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: ColorManager.darkBlue),),
                        )),
                    SizedBox(width: 20.w),
                    Expanded(
                        child: CustomTextField(
                          hint: '10',
                          controller: controller.cprNumberController,
                          labelWidget:  Text(Strings.cprNumber,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: ColorManager.darkBlue),),
                        ))
                  ],
                ),
                SizedBox(height: 40.h),
                PrimaryButton(
                  title: Strings.changeYourPassword,
                  onPressed: () {
                    Get.toNamed(Routes.changePassword);
                  },
                  height: 40.h,
                  backgroundColor: ColorManager.white,
                  textAndIconColor: ColorManager.primaryBTNColorBrown,
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),

        drawer:
            customDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

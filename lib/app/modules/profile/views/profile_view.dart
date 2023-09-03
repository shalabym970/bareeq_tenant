import 'package:Bareeq/common/widgets/label_text_field.dart';
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
import '../../../routes/app_routes.dart';
import '../controllers/profile_controller.dart';
import '../widgets/contacts/contacts_widget.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Get.offAllNamed(Routes.dashboard);
          return false;
        },
        child: RefreshIndicator(
            color: ColorManager.mainColor,
            onRefresh: () async {
              controller.onInit();
            },
            child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Scaffold(
                    appBar: customAppBar(
                        title: Strings.profile,
                        svgProfileIcon: ImagePaths.profileBrown),
                    floatingActionButton: FloatingActionButton(
                        onPressed: () {
                          Get.offAllNamed(Routes.dashboard);
                        },
                        heroTag: null,
                        backgroundColor: ColorManager.mainColor,
                        child: SvgPicture.asset(ImagePaths.save,
                            height: 20.h, width: 20.w)),
                    body: Padding(
                        padding: EdgeInsets.only(right: 10.w, left: 10.w),
                        child: SingleChildScrollView(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                              SizedBox(height: 40.h),
                              const ContactsWidget(),
                              SizedBox(height: 20.h),
                              Row(children: [
                                Padding(
                                    padding: EdgeInsets.all(6.h),
                                    child: SvgPicture.asset(
                                        ImagePaths.bluePerson,
                                        height: 20.h,
                                        width: 20.w)),
                                Padding(
                                    padding: EdgeInsets.all(6.h),
                                    child: Text(Strings.yourProfileData,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold)))
                              ]),
                              SizedBox(height: 10.h),
                              Row(children: [
                                Expanded(
                                    child: CustomTextField(
                                        hint: controller.currentUser.firstName
                                            .toString(),
                                        backgroundColor: Colors.grey[400],
                                        labelWidget: const LabelTextField(
                                            label: Strings.firstName),
                                        enabled: false)),
                                SizedBox(width: 20.w),
                                Expanded(
                                    child: CustomTextField(
                                        hint: controller.currentUser.lastName
                                            .toString(),
                                        backgroundColor: Colors.grey[400],
                                        labelWidget: const LabelTextField(
                                            label: Strings.lastName),
                                        enabled: false))
                              ]),
                              SizedBox(height: 20.h),
                              CustomTextField(
                                  controller: controller.jobTitleController,
                                  labelWidget: const LabelTextField(
                                      label: Strings.jobTitle)),
                              SizedBox(height: 20.h),
                              CustomTextField(
                                  controller: controller.mobileNumberController,
                                  keyboardType: TextInputType.phone,
                                  labelWidget: const LabelTextField(
                                      label: Strings.mobileNumber)),
                              SizedBox(height: 20.h),
                              CustomTextField(
                                  hint: controller.currentUser.emailAddress
                                      .toString(),
                                  backgroundColor: Colors.grey[400],
                                  labelWidget: const LabelTextField(
                                      label: Strings.email),
                                  enabled: false),
                              SizedBox(height: 20.h),
                              CustomTextField(
                                  hint: controller.currentUser.account!.name
                                      .toString(),
                                  backgroundColor: Colors.grey[400],
                                  labelWidget: const LabelTextField(
                                      label: Strings.accountName),
                                  enabled: false),
                              SizedBox(height: 20.h),
                              Row(children: [
                                Expanded(
                                    child: CustomTextField(
                                        controller:
                                            controller.crNumberController,
                                        keyboardType: TextInputType.number,
                                        labelWidget: const LabelTextField(
                                            label: Strings.crNumber))),
                                SizedBox(width: 20.w),
                                Expanded(
                                    child: CustomTextField(
                                        controller:
                                            controller.cprNumberController,
                                        keyboardType: TextInputType.number,
                                        labelWidget: const LabelTextField(
                                            label: Strings.cprNumber)))
                              ]),
                              SizedBox(height: 40.h),
                              PrimaryButton(
                                  title: Strings.changePassword,
                                  onPressed: () {
                                    Get.toNamed(Routes.changePassword);
                                  },
                                  height: 40.h,
                                  backgroundColor: ColorManager.white,
                                  textAndIconColor: ColorManager.mainColor,
                                  width: 0.5.sw),
                              SizedBox(height: 40.h)
                            ]))),
                    drawer:
                        customDrawer() // This trailing comma makes auto-formatting nicer for build methods.
                    ))));
  }
}

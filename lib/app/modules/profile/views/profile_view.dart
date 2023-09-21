import 'package:bareeq/common/widgets/label_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_details_app_bar.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../../common/widgets/no_internet_connection_widget.dart';
import '../../../../common/widgets/second_custom_loading.dart';
import '../../../../common/widgets/ui.dart';
import '../../../routes/app_routes.dart';
import '../controllers/profile_controller.dart';
import '../widgets/contacts/contacts_widget.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.connectionController.isConnected.isTrue
        ?  WillPopScope(
        onWillPop: () async {
          if (controller.profileIsChanged) {
            Ui.confirmDialog(
                middleText: Strings.saveProfileChangedData,
                confirmBtnTitle: Strings.save,
                onSave: () {
                  Get.back();
                  controller.changeProfile();
                },
                onDiscard: () {
                  Get.offAllNamed(Routes.dashboard);
                },
                title: Strings.confirm);
          } else {
            Get.back();
          }
          return false;
        },
        child: RefreshIndicator(
            color: ColorManager.mainColor,
            onRefresh: () async {
              controller.onInit();
            },
            child: Stack(children: [
              GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Scaffold(
                    appBar: customDetailsAppBar(title: Strings.profile),
                    floatingActionButton: FloatingActionButton(
                        onPressed: () {
                          controller.changeProfile();
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
                              SizedBox(height: 20.h),
                              const ContactsWidget(),
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
                                        controller:
                                            controller.firstNameController,
                                        backgroundColor: Colors.grey[400],
                                        labelWidget: const LabelTextField(
                                            label: Strings.firstName),
                                        enabled: false)),
                                SizedBox(width: 20.w),
                                Expanded(
                                    child: CustomTextField(
                                        controller:
                                            controller.lastNameController,
                                        backgroundColor: Colors.grey[400],
                                        labelWidget: const LabelTextField(
                                            label: Strings.lastName),
                                        enabled: false))
                              ]),
                              SizedBox(height: 20.h),
                              Form(
                                  key: controller.changeProfileKey,
                                  child: Column(children: [
                                    CustomTextField(
                                        controller:
                                            controller.jobTitleController,
                                        validator: (value) => value!.isEmpty
                                            ? ErrorStrings.enterJobTitle
                                            : null,
                                        onChanged: (value) => value !=
                                                controller.currentUser.jobTile
                                                    .toString()
                                            ? controller.profileIsChanged = true
                                            : null,
                                        labelWidget: const LabelTextField(
                                            label: Strings.jobTitle)),
                                    SizedBox(height: 20.h),
                                    CustomTextField(
                                        controller:
                                            controller.mobileNumberController,
                                        validator: (value) => value!.isEmpty
                                            ? ErrorStrings.enterPhone
                                            : null,
                                        onChanged: (value) => value !=
                                                controller
                                                    .currentUser.mobilePhone
                                                    .toString()
                                            ? controller.profileIsChanged = true
                                            : null,
                                        keyboardType: TextInputType.phone,
                                        labelWidget: const LabelTextField(
                                            label: Strings.mobileNumber)),
                                    SizedBox(height: 20.h),
                                    CustomTextField(
                                        controller: controller.emailController,
                                        backgroundColor: Colors.grey[400],
                                        labelWidget: const LabelTextField(
                                            label: Strings.email),
                                        enabled: false),
                                    SizedBox(height: 20.h),
                                    CustomTextField(
                                        controller:
                                            controller.accountNameController,
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
                                              validator: (value) => value!
                                                      .isEmpty
                                                  ? ErrorStrings.enterCRNumber
                                                  : null,
                                              onChanged: (value) => value !=
                                                      controller
                                                          .currentUser.crNumber
                                                          .toString()
                                                  ? controller
                                                      .profileIsChanged = true
                                                  : null,
                                              keyboardType:
                                                  TextInputType.number,
                                              labelWidget: const LabelTextField(
                                                  label: Strings.crNumber))),
                                      SizedBox(width: 20.w),
                                      Expanded(
                                          child: CustomTextField(
                                              controller: controller
                                                  .cprNumberController,
                                              validator: (value) => value!
                                                      .isEmpty
                                                  ? ErrorStrings.enterCPRNumber
                                                  : null,
                                              onChanged: (value) => value !=
                                                      controller
                                                          .currentUser.cprNumber
                                                          .toString()
                                                  ? controller
                                                      .profileIsChanged = true
                                                  : null,
                                              keyboardType:
                                                  TextInputType.number,
                                              labelWidget: const LabelTextField(
                                                  label: Strings.cprNumber)))
                                    ])
                                  ])),
                              SizedBox(height: 20.h),
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
                            ])))
                  )),
              Obx(() => Visibility(
                  visible:
                      controller.changeProfileLoading.isTrue ? true : false,
                  child: const Opacity(
                      opacity: 0.8,
                      child: ModalBarrier(
                          dismissible: false, color: Colors.black)))),
              Obx(() => Visibility(
                  visible:
                      controller.changeProfileLoading.isTrue ? true : false,
                  child: const Center(child: SecondCustomLoading())))
            ]))) : const NoInternetConnectionView());
  }
}

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
import '../../../../common/widgets/label_text_field.dart';
import '../../../../common/widgets/no_internet_connection_widget.dart';
import '../../../../common/widgets/second_custom_loading.dart';
import '../../../services/general_services.dart';
import '../controllers/add_contact_controller.dart';

class AddContactView extends GetView<AddContactController> {
  const AddContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.connectionController.isConnected.isTrue
        ? Scaffold(
            appBar: customDetailsAppBar(title: Strings.newContact),
            body: Stack(children: [
              GestureDetector(
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
                                      controller:
                                          controller.firstNameController,
                                      validator: (value) => value!.isEmpty
                                          ? Strings.firstName
                                          : null,
                                      labelWidget: const LabelTextField(
                                          label: Strings.firstName,
                                          isRequired: true),
                                    ),
                                    SizedBox(height: 20.h),
                                    CustomTextField(
                                      hint: Strings.lastName,
                                      controller: controller.lastNameController,
                                      validator: (value) => value!.isEmpty
                                          ? Strings.lastName
                                          : null,
                                      labelWidget: const LabelTextField(
                                          label: Strings.lastName,
                                          isRequired: true),
                                    ),
                                    SizedBox(height: 20.h),
                                    CustomTextField(
                                      hint: Strings.jobTitle,
                                      controller: controller.jobTitleController,
                                      validator: (value) => value!.isEmpty
                                          ? Strings.jobTitle
                                          : null,
                                      labelWidget: const LabelTextField(
                                          label: Strings.jobTitle,
                                          isRequired: true),
                                    ),
                                    SizedBox(height: 20.h),
                                    CustomTextField(
                                        hint: Strings.email,
                                        controller: controller.emailController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return ErrorStrings.enterEmail;
                                          } else if (!GeneralServices
                                              .isEmailValid(value)) {
                                            return ErrorStrings.enterValidEmail;
                                          }
                                          return null; // Return null to indicate no validation error
                                        },
                                        labelWidget: const LabelTextField(
                                            label: Strings.email,
                                            isRequired: true)),
                                    SizedBox(height: 20.h),
                                    CustomTextField(
                                        hint: Strings.phoneNumber,
                                        keyboardType: TextInputType.phone,
                                        controller:
                                            controller.mobileNumberController,
                                        validator: (value) => value!.isEmpty
                                            ? Strings.mobileNumber
                                            : null,
                                        labelWidget: const LabelTextField(
                                            label: Strings.phoneNumber,
                                            isRequired: true)),
                                    SizedBox(height: 20.h),
                                    CustomTextField(
                                        hint: Strings.businessPhone,
                                        controller:
                                            controller.businessPhoneController,
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
              Obx(() => Visibility(
                  visible: controller.submitLoading.isTrue ? true : false,
                  child: const Opacity(
                      opacity: 0.8,
                      child: ModalBarrier(
                          dismissible: false, color: Colors.black)))),
              Obx(() => Visibility(
                  visible: controller.submitLoading.isTrue ? true : false,
                  child: const Center(child: SecondCustomLoading())))
            ]))
        : const NoInternetConnectionView());
  }
}
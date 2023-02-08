import 'package:Seef/common/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_attachment_widget.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../../common/widgets/custom_dropdown.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../routes/app_routes.dart';
import '../controllers/add_work_permit_controller.dart';

class AddWorkPermitView extends GetView<AddWorkPermitController> {
  const AddWorkPermitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(title: Strings.newWorkPermit),
        body: Padding(
            padding: EdgeInsets.only(right: 10.w, left: 10.w),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextField(
                      hint: Strings.subject,
                      controller: controller.subjectController,
                      labelWidget: Text(Strings.subject,
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorManager.darkBlue))),
                  SizedBox(height: 20.h),
                  Obx(() => CustomCheckBox(
                      value: controller.standardCheck.value,
                      onChanged: (bool? value) {
                        if (controller.urgentCheck.isTrue) {
                          controller.urgentCheck.value =
                              !controller.urgentCheck.value;
                          controller.standardCheck.value =
                              !controller.standardCheck.value;
                        } else {
                          controller.standardCheck.value =
                              !controller.standardCheck.value;
                        }
                      },
                      title: Strings.standardWorkPermit)),
                  Obx(() => CustomCheckBox(
                      value: controller.urgentCheck.value,
                      onChanged: (bool? value) {
                        if (controller.standardCheck.isTrue) {
                          controller.standardCheck.value =
                              !controller.standardCheck.value;
                          controller.urgentCheck.value =
                              !controller.urgentCheck.value;
                        } else {
                          controller.urgentCheck.value =
                              !controller.urgentCheck.value;
                        }
                      },
                      title: Strings.urgentWorkPermit)),
                  SizedBox(height: 20.h),
                  Row(children: [
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            controller.selectDate(dateTypeIsStart: true);
                          },
                          child: Obx(() => CustomTextField(
                              suffixIcon: ImagePaths.deleteCalendar,
                              enabled: false,
                              hint: controller.selectedStartDate.value,
                              controller: controller.startDateController,
                              labelWidget: Text(Strings.startDate,
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500,
                                      color: ColorManager.darkBlue)))),
                        )),
                    SizedBox(width: 15.w),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            controller.selectDate(dateTypeIsStart: false);
                          },
                          child: Obx(() => CustomTextField(
                              suffixIcon: ImagePaths.deleteCalendar,
                              enabled: false,
                              hint: controller.selectedEndDate.value,
                              controller: controller.endDateController,
                              labelWidget: Text(Strings.endDate,
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500,
                                      color: ColorManager.darkBlue)))),
                        ))
                  ]),
                  SizedBox(height: 30.h),
                  CustomDropDown(
                    value: controller.relatedUnitValue,
                    onChange: (String? newValue) async {},
                    items: controller.relatedUnitList.map((items) {
                      return DropdownMenuItem<String>(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    label: Strings.relatedUnit,
                  ),
                  SizedBox(height: 20.h),
                  CustomDropDown(
                    value: controller.contractorValue,
                    onChange: (String? newValue) async {},
                    items: controller.contractorList.map((items) {
                      return DropdownMenuItem<String>(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    label: Strings.contractor,
                  ),
                  SizedBox(height: 30.h),
                  PrimaryButton(
                      title: Strings.newContractor,
                      onPressed: () {
                        Get.toNamed(Routes.addContractor);
                      },
                      height: 40.h,
                      backgroundColor: ColorManager.white,
                      textAndIconColor: ColorManager.primaryBTNColorBrown),
                  SizedBox(height: 30.h),
                  CustomTextField(
                      hint: Strings.numberOfWorkers,
                      controller: controller.subjectController,
                      labelWidget: Text(Strings.numberOfWorkers,
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorManager.darkBlue))),
                  SizedBox(height: 20.h),
                  CustomTextField(
                    height: 105.h,
                    hint: Strings.requestDetails,
                    controller: controller.subjectController,
                    labelWidget: Text(Strings.requestDetails,
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorManager.darkBlue)),
                    maxLines: 6,
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(height: 10.h),
                  const CustomAttachmentWidget(
                      svgPrefixIcon: ImagePaths.document,
                      svgSuffixIcon: ImagePaths.upload),
                  SizedBox(height: 10.h),
                  const CustomAttachmentWidget(
                      svgPrefixIcon: ImagePaths.document,
                      svgSuffixIcon: ImagePaths.upload),
                  SizedBox(height: 10.h),
                  const CustomAttachmentWidget(
                      svgPrefixIcon: ImagePaths.document,
                      svgSuffixIcon: ImagePaths.upload),
                  SizedBox(height: 10.h),
                  const CustomAttachmentWidget(
                      svgPrefixIcon: ImagePaths.document,
                      svgSuffixIcon: ImagePaths.upload),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Obx(() => Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                            value: controller.acceptResponsibilityCheck.value,
                            onChanged: (bool? value) {
                              controller.acceptResponsibilityCheck.value =
                                  !controller.acceptResponsibilityCheck.value;
                            },
                          )),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: Strings.readAcceptResponse,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: ColorManager.black,
                                      fontWeight: FontWeight.w500)),
                              TextSpan(
                                  text: Strings.acceptanceResponse,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 14.sp,
                                      color: ColorManager.darkBlue,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  PrimaryButton(
                      title: Strings.addWorkPermit,
                      onPressed: () {},
                      height: 40.h,
                      backgroundColor: ColorManager.primaryBTNColorBrown,
                      textAndIconColor: ColorManager.white),
                  SizedBox(height: 20.h)
                ]))),
        drawer:
            customDrawer() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

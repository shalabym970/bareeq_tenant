import 'package:Bareeq/common/widgets/custom_checkbox.dart';
import 'package:Bareeq/common/widgets/label_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/attachament_title_public_widget.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../../common/widgets/custom_dropdown.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../routes/app_routes.dart';
import '../controllers/add_work_permit_controller.dart';
import '../widgets/attachments/add_cpr_card_attachment.dart';
import '../widgets/attachments/add_insurance_attachment.dart';
import '../widgets/attachments/add_method_statement_attachment.dart';
import '../widgets/attachments/add_risk_assessment_attachment.dart';

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
                    height: 20.h,
                  ),
                  Form(
                      key: controller.addWorkPermitKey,
                      child: Column(
                        children: [
                          CustomTextField(
                              hint: Strings.subject,
                              controller: controller.subjectController,
                              validator: (value) =>
                                  value!.isEmpty ? Strings.enterSubject : null,
                              labelWidget: const LabelTextField(
                                  label: Strings.subject, isRequired: true)),
                          SizedBox(height: 10.h),
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
                          SizedBox(height: 10.h),
                          Row(children: [
                            Expanded(
                                flex: 1,
                                child: InkWell(
                                    onTap: () {
                                      controller.selectDate(
                                          dateTypeIsStart: true);
                                    },
                                    child: Obx(() => CustomTextField(
                                        stringSuffixIcon:
                                            ImagePaths.deleteCalendar,
                                        enabled: false,
                                        hint:
                                            controller.selectedStartDate.value,
                                        controller:
                                            controller.startDateController,
                                        validator: (value) => value!.isEmpty
                                            ? Strings.selectStartDate
                                            : null,
                                        labelWidget: const LabelTextField(
                                            label: Strings.startDate,
                                            isRequired: true))))),
                            SizedBox(width: 15.w),
                            Expanded(
                                flex: 1,
                                child: InkWell(
                                    onTap: () {
                                      controller.selectDate(
                                          dateTypeIsStart: false);
                                    },
                                    child: Obx(() => CustomTextField(
                                        stringSuffixIcon:
                                            ImagePaths.deleteCalendar,
                                        enabled: false,
                                        hint: controller.selectedEndDate.value,
                                        controller:
                                            controller.endDateController,
                                        validator: (value) => value!.isEmpty
                                            ? Strings.selectEndDate
                                            : null,
                                        labelWidget: const LabelTextField(
                                            label: Strings.endDate,
                                            isRequired: true)))))
                          ]),
                          SizedBox(height: 20.h),
                          CustomDropDown(
                              value: controller.relatedUnitValue,
                              onChange: (String? newValue) async {},
                              items: controller.relatedUnitList.map((items) {
                                return DropdownMenuItem<String>(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              label: Strings.relatedUnit),
                          SizedBox(height: 10.h),
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
                          SizedBox(height: 20.h),
                          PrimaryButton(
                              title: Strings.newContractor,
                              onPressed: () {
                                Get.toNamed(Routes.addContractor);
                              },
                              height: 40.h,
                              backgroundColor: ColorManager.white,
                              textAndIconColor: ColorManager.mainColor),
                          SizedBox(height: 20.h),
                          CustomTextField(
                              hint: Strings.numberOfWorkers,
                              controller: controller.numberOfWorkersController,
                              keyboardType: TextInputType.number,
                              validator: (value) => value!.isEmpty
                                  ? Strings.enterWorkerNumber
                                  : null,
                              labelWidget: const LabelTextField(
                                  label: Strings.numberOfWorkers,
                                  isRequired: true)),
                          SizedBox(height: 10.h),
                          CustomTextField(
                            height: 105.h,
                            hint: Strings.requestDetails,
                            controller: controller.detailsController,
                            labelWidget: const LabelTextField(
                                label: Strings.requestDetails,
                                isRequired: true),
                            validator: (value) =>
                                value!.isEmpty ? Strings.enterDetails : null,
                            maxLines: 6,
                          ),
                        ],
                      )),
                  SizedBox(height: 20.h),
                  const AttachmentTitlePublicWidget(),
                  SizedBox(height: 20.h),
                  const AddCprCardAttachment(),
                  const AddInsuranceAttachment(),
                  const AddMethodStatementAttachment(),
                  const AddRiskAssessmentAttachment(),
                  SizedBox(height: 20.h),
                  Row(children: [
                    Icon(Icons.star_rate_sharp,
                        color: ColorManager.red, size: 8.sp),
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
                            text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: Strings.readAcceptResponse,
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: ColorManager.black,
                              fontWeight: FontWeight.w500)),
                      TextSpan(
                          text: Strings.acceptanceResponse,
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 12.sp,
                              color: ColorManager.mainColor,
                              fontWeight: FontWeight.w500))
                    ])))
                  ]),
                  SizedBox(height: 20.h),
                  PrimaryButton(
                      title: Strings.addWorkPermit,
                      onPressed: () {
                        controller.submitWorkPermit();
                      },
                      height: 40.h,
                      backgroundColor: ColorManager.mainColor,
                      textAndIconColor: ColorManager.white),
                  SizedBox(height: 20.h)
                ]))),
        drawer:
            customDrawer() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

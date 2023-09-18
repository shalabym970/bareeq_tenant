import 'package:bareeq/common/widgets/custom_checkbox.dart';
import 'package:bareeq/common/widgets/label_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/attachament_title_public_widget.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../../common/widgets/second_custom_loading.dart';
import '../../../routes/app_routes.dart';
import '../controllers/create_work_permit_controller.dart';
import '../widgets/attachments/add_cpr_card_attachment.dart';
import '../widgets/attachments/add_insurance_attachment.dart';
import '../widgets/attachments/add_method_statement_attachment.dart';
import '../widgets/attachments/add_risk_assessment_attachment.dart';
import '../widgets/contractor_drop_down_widget.dart';
import '../widgets/related_unit_drop_down_widget.dart';
import '../widgets/work_permit_terms.dart';

class AddWorkPermitView extends GetView<CreateWorkPermitController> {
  const AddWorkPermitView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        color: ColorManager.mainColor,
        onRefresh: () async {
          controller.onInit();
        },
        child: Scaffold(
            appBar: customAppBar(title: Strings.newWorkPermit),
            body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Stack(children: [
                  Padding(
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
                                        controller:
                                            controller.subjectController,
                                        validator: (value) => value!.isEmpty
                                            ? ErrorStrings.enterSubject
                                            : null,
                                        labelWidget: const LabelTextField(
                                            label: Strings.subject,
                                            isRequired: true)),
                                    SizedBox(height: 10.h),
                                    Obx(() => CustomCheckBox(
                                        value: controller.standardCheck.value,
                                        onChanged: (bool? value) {
                                          FocusScope.of(context).unfocus();
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
                                          FocusScope.of(context).unfocus();
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
                                                FocusScope.of(context)
                                                    .unfocus();

                                                controller.selectDate(
                                                    dateTypeIsStart: true);
                                              },
                                              child: Obx(() => CustomTextField(
                                                  suffixIcon: Icon(
                                                    Icons
                                                        .calendar_month_outlined,
                                                    size: 30.sp,
                                                    color:
                                                        ColorManager.mainColor,
                                                  ),
                                                  enabled: false,
                                                  hint: controller
                                                      .selectedStartDate.value,
                                                  controller: controller
                                                      .startDateController,
                                                  validator: (value) => value!
                                                          .isEmpty
                                                      ? Strings.selectStartDate
                                                      : null,
                                                  labelWidget:
                                                      const LabelTextField(
                                                          label:
                                                              Strings.startDate,
                                                          isRequired: true))))),
                                      SizedBox(width: 15.w),
                                      Expanded(
                                          flex: 1,
                                          child: InkWell(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();

                                                controller.selectDate(
                                                    dateTypeIsStart: false);
                                              },
                                              child: Obx(() => CustomTextField(
                                                  suffixIcon: Icon(
                                                    Icons
                                                        .calendar_month_outlined,
                                                    size: 30.sp,
                                                    color:
                                                        ColorManager.mainColor,
                                                  ),
                                                  enabled: false,
                                                  hint: controller
                                                      .selectedEndDate.value,
                                                  controller: controller
                                                      .endDateController,
                                                  validator: (value) => value!
                                                          .isEmpty
                                                      ? Strings.selectEndDate
                                                      : null,
                                                  labelWidget:
                                                      const LabelTextField(
                                                          label:
                                                              Strings.endDate,
                                                          isRequired: true)))))
                                    ]),
                                    SizedBox(height: 20.h),
                                    const RelatedUnitDropDownWidget(),
                                    SizedBox(height: 10.h),
                                    const ContractorDropDownWidget(),
                                    SizedBox(height: 20.h),
                                    PrimaryButton(
                                        title: Strings.newContractor,
                                        onPressed: () {
                                          Get.toNamed(Routes.addContractor);
                                        },
                                        height: 40.h,
                                        backgroundColor: ColorManager.white,
                                        textAndIconColor:
                                            ColorManager.mainColor),
                                    SizedBox(height: 20.h),
                                    CustomTextField(
                                        hint: Strings.numberOfWorkers,
                                        controller: controller
                                            .numberOfWorkersController,
                                        keyboardType: TextInputType.number,
                                        validator: (value) => value!.isEmpty
                                            ? ErrorStrings.enterWorkerNumber
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
                                      validator: (value) => value!.isEmpty
                                          ? ErrorStrings.enterDetails
                                          : null,
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
                                  fillColor: MaterialStateProperty.all<Color>(
                                      controller
                                              .acceptResponsibilityCheck.isTrue
                                          ? ColorManager.mainColor
                                          : ColorManager.red),
                                  value: controller
                                      .acceptResponsibilityCheck.value,
                                  onChanged: (bool? value) {
                                    FocusScope.of(context).unfocus();

                                    controller.acceptResponsibilityCheck.value =
                                        !controller
                                            .acceptResponsibilityCheck.value;
                                  })),
                              Expanded(
                                  child: InkWell(
                                      onTap: () {
                                        workPermitTerm();
                                      },
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
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 12.sp,
                                                color: ColorManager.mainColor,
                                                fontWeight: FontWeight.w500))
                                      ]))))
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
                  Obx(() => Visibility(
                      visible: controller.submitLoading.isTrue ? true : false,
                      child: const Opacity(
                          opacity: 0.8,
                          child: ModalBarrier(
                              dismissible: false, color: Colors.black)))),
                  Obx(() => Visibility(
                      visible: controller.submitLoading.isTrue ? true : false,
                      child: const Center(child: SecondCustomLoading())))
                ])),
            drawer:
                customDrawer() // This trailing comma makes auto-formatting nicer for build methods.
            ));
  }
}

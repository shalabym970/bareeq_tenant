import 'package:bareeq/common/widgets/label_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../../common/widgets/second_custom_loading.dart';
import '../controllers/add_case_controller.dart';
import '../widgets/case_related_unit_drop_down_widget.dart';
import '../widgets/select_case_types_widget.dart';
import '../widgets/select_nature_of_complaint_widget.dart';
import '../widgets/select_priority_widget.dart';

class AddCaseView extends GetView<AddCaseController> {
  const AddCaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(title: Strings.newCase),
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Stack(children: [
              Padding(
                  padding: EdgeInsets.only(right: 20.w, left: 20.w),
                  child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Form(
                            key: controller.addCaseKey,
                            child: Column(children: [
                              CustomTextField(
                                  hint: Strings.caseTitle,
                                  controller: controller.caseTitleController,
                                  validator: (value) => value!.isEmpty
                                      ? ErrorStrings.enterTitle
                                      : null,
                                  labelWidget: const LabelTextField(
                                      label: Strings.caseTitle,
                                      isRequired: true)),
                              SizedBox(height: 20.h),
                              const SelectCaseTypesWidget(),
                              SizedBox(height: 20.h),
                              const SelectNatureOfComplaintWidget(),
                              SizedBox(height: 20.h),
                              const CaseRelatedUnitDropDownWidget(),
                              SizedBox(height: 20.h),
                              const SelectPriorityWidget(),
                              SizedBox(height: 20.h),
                              CustomTextField(
                                  height: 105.h,
                                  hint: Strings.requestDetails,
                                  controller:
                                      controller.caseDescriptionController,
                                  validator: (value) => value!.isEmpty
                                      ? ErrorStrings.enterDetails
                                      : null,
                                  labelWidget: const LabelTextField(
                                      label: Strings.requestDetails,
                                      isRequired: true),
                                  maxLines: 6)
                            ])),
                        SizedBox(height: 20.h),
                        PrimaryButton(
                            title: Strings.addCase,
                            onPressed: () {
                              controller.submitCase();
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
        drawer: customDrawer());
  }
}

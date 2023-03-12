import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../../common/widgets/custom_dropdown.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../controllers/add_case_controller.dart';

class AddCaseView extends GetView<AddCaseController> {
  const AddCaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(title: Strings.newCase),
        body: Padding(
            padding: EdgeInsets.only(right: 20.w, left: 20.w),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomTextField(
                      hint: Strings.caseTitle,
                      controller: controller.caseTitleController,
                      labelWidget: Text(Strings.caseTitle,
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorManager.darkBlue))),
                  SizedBox(height: 20.h),
                  CustomDropDown(
                    value: controller.caseTypeValue,
                    onChange: (String? newValue) async {},
                    items: controller.caseTypeList.map((items) {
                      return DropdownMenuItem<String>(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    label: Strings.caseType,
                  ),
                      SizedBox(height: 20.h),
                  CustomDropDown(
                    value: controller.natureOfCaseValue,
                    onChange: (String? newValue) async {},
                    items: controller.natureOfCaseList.map((items) {
                      return DropdownMenuItem<String>(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    label: Strings.natureOfCase,
                  ),
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
                    label: Strings.relatedUnit,
                  ),
                      SizedBox(height: 20.h),
                      CustomDropDown(
                        value: controller.relatedLeaseValue,
                        onChange: (String? newValue) async {},
                        items: controller.relatedLeaseList.map((items) {
                          return DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        label: Strings.relatedLease,
                      ),
                      SizedBox(height: 20.h),
                  CustomTextField(
                    height: 105.h,
                    hint: Strings.requestDetails,
                    controller: controller.requestDetailsController,
                    labelWidget: Text(Strings.requestDetails,
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorManager.darkBlue)),
                    maxLines: 6,
                  ),

                  SizedBox(height: 20.h),
                  PrimaryButton(
                      title: Strings.addCase,
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

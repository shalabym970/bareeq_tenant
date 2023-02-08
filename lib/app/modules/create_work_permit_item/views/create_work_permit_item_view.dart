import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../../common/widgets/custom_dropdown.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../controllers/create_work_permit_item_controller.dart';

class CreateWorkPermitItemView extends GetView<CreateWorkPermitItemController> {
  const CreateWorkPermitItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: customAppBar(title: Strings.newItem),
      body: Padding(
        padding:
            EdgeInsets.only(top: 30.h, right: 15.w, left: 15.w, bottom: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
              key: controller.messageFormKey,
              child: Column(
                children: [
                  Column(
                    children: [
                      CustomDropDown(
                        value: controller.relatedWorkPermitValue,
                        onChange: (String? newValue) async {},
                        items: controller.relatedWorkPermitList.map((items) {
                          return DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        label: Strings.relatedWorkPermit,
                      ),
                      SizedBox(height: 20.h),
                      CustomDropDown(
                        value: controller.relatedWorkPermitValue,
                        onChange: (String? newValue) async {},
                        items: controller.relatedWorkPermitList.map((items) {
                          return DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        label: Strings.itemType,
                      ),
                      SizedBox(height: 20.h),
                      CustomTextField(
                        height: 105.h,
                        hint: Strings.enterDescriptionHere,
                        controller: controller.descriptionController,
                        labelWidget: Text(Strings.description,
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorManager.darkBlue)),
                        maxLines: 6,
                      ),
                      SizedBox(height: 50.h),
                      PrimaryButton(
                          title: Strings.createItem,
                          onPressed: () {
                            Get.back();
                          },
                          height: 40.h,
                          backgroundColor: ColorManager.primaryBTNColorBrown,
                          textAndIconColor: ColorManager.white),
                      SizedBox(height: 50.h),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: customDrawer(),
    );
  }
}

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
import '../controllers/create_message_controller.dart';

class CreateMessageView extends GetView<CreateMessageController> {
  const CreateMessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: customAppBar(title: Strings.newMessage),
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
                        value: controller.caseValue,
                        onChange: (String? newValue) async {},
                        items: controller.caseList.map((items) {
                          return DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        label: Strings.relatedUnit,
                      ),
                      SizedBox(height: 20.h),
                      CustomTextField(
                          hint: Strings.messageTitle,
                          controller: controller.messageTitleController,
                          labelWidget: Text(Strings.title,
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.darkBlue))),
                      SizedBox(height: 20.h),
                      CustomTextField(
                        height: 105.h,
                        hint: Strings.enterYourMessageHere,
                        controller: controller.messageController,
                        labelWidget: Text(Strings.message,
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorManager.darkBlue)),
                        maxLines: 6,
                      ),
                      SizedBox(height: 50.h),
                      PrimaryButton(
                          title: Strings.sendMessage,
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

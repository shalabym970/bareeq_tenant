import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:property_pro/app/modules/messages/controllers/messages_controller.dart';

import '../../../../common/color_manager.dart';
import '../../../../common/strings.dart';

class MessagesSwitcherBTN extends GetView<MessagesController> {
  const MessagesSwitcherBTN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        height: 48.h,
        width: Get.width,
        decoration: BoxDecoration(
          color: ColorManager.darkBlue,
        ),
        child: Row(children: [
          Expanded(
              flex: 1,
              child: GestureDetector(
                  onTap: () {
                    controller.selectInboxMessages.value = true;
                  },
                  child: Container(
                      color: controller.selectInboxMessages.isTrue
                          ? ColorManager.white
                          : ColorManager.darkBlue,
                      height: 43.h,
                      child: Center(
                          child: Text(Strings.inbox,
                              style: TextStyle(
                                  color: controller.selectInboxMessages.isTrue
                                      ? ColorManager.darkBlue
                                      : ColorManager.white,
                                  fontSize: 14.sp,fontWeight: FontWeight.w600)))))),
          Expanded(
              flex: 1,
              child: GestureDetector(
                  onTap: () {
                    controller.selectInboxMessages.value = false;
                  },
                  child: Container(
                      color: controller.selectInboxMessages.isTrue
                          ? ColorManager.darkBlue
                          : ColorManager.white,
                      height: 43.h,
                      child: Center(
                          child: Text(Strings.sent,
                              style: TextStyle(
                                  color: controller.selectInboxMessages.isTrue
                                      ? ColorManager.white
                                      : ColorManager.darkBlue,
                                  fontSize: 14.sp,fontWeight: FontWeight.w600))))))
        ])));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings/strings.dart';
import '../controllers/messages_controller.dart';

class MessagesSwitcherBTN extends GetView<MessagesController> {
  const MessagesSwitcherBTN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        height: 48.h,
        width: Get.width,
        decoration: BoxDecoration(
          color: ColorManager.mainColor,
        ),
        child: Row(children: [
          Expanded(
              flex: 1,
              child: GestureDetector(
                  onTap: () {
                    if (controller.selectInboxMessages.isFalse) {
                      controller.selectInboxMessages.value =
                          !controller.selectInboxMessages.value;
                      controller.getMessages();
                    }
                  },
                  child: Container(
                      color: controller.selectInboxMessages.isTrue
                          ? ColorManager.white
                          : ColorManager.mainColor,
                      height: 43.h,
                      child: Center(
                          child: Text(Strings.inbox,
                              style: TextStyle(
                                  color: controller.selectInboxMessages.isTrue
                                      ? ColorManager.mainColor
                                      : ColorManager.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600)))))),
          Expanded(
              flex: 1,
              child: GestureDetector(
                  onTap: () {
                    if (controller.selectInboxMessages.isTrue) {
                      controller.selectInboxMessages.value =
                          !controller.selectInboxMessages.value;
                      controller.getMessages();
                    }
                  },
                  child: Container(
                      color: controller.selectInboxMessages.isTrue
                          ? ColorManager.mainColor
                          : ColorManager.white,
                      height: 43.h,
                      child: Center(
                          child: Text(Strings.sent,
                              style: TextStyle(
                                  color: controller.selectInboxMessages.isTrue
                                      ? ColorManager.white
                                      : ColorManager.mainColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600))))))
        ])));
  }
}

import 'package:Bareeq/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:Bareeq/common/strings/error_strings.dart';
import 'package:Bareeq/common/widgets/label_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/constants.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_details_item.dart';
import '../../../../common/widgets/second_custom_loading.dart';
import '../../../services/general_services.dart';
import '../controllers/message_details_controller.dart';
import '../widgets/attachments/message_attachments_list.dart';
import '../widgets/attachments/message_uploaded_attachment_list.dart';

class MessageDetailsView extends GetView<MessageDetailsController> {
  const MessageDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackButton(color: ColorManager.mainColor),
                      if (controller.message.direction == true)
                        Row(children: [
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.h)),
                                  color: controller.message.readStatus == true
                                      ? ColorManager.red
                                      : ColorManager.green),
                              height: 10.h,
                              width: 10.w),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 10.w),
                              child: Text(
                                  controller.message.readStatus == true
                                      ? Strings.unread
                                      : Strings.read,
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color:
                                          controller.message.readStatus == true
                                              ? ColorManager.red
                                              : ColorManager.green,
                                      fontWeight: FontWeight.w500)))
                        ])
                    ]),
                Expanded(
                    child: SingleChildScrollView(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20.h),
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(Strings.subject,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.sp,
                                                color: ColorManager.mainColor)),
                                        SizedBox(height: 5.h),
                                        Text(
                                            controller.message.subject
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: ColorManager.black)),
                                      ]),
                                  SizedBox(height: 20.h),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: customDetailsItem(
                                                icon: ImagePaths.arrowTop,
                                                title: Strings.from,
                                                color: ColorManager.mainColor,
                                                value: controller.rout ==
                                                        Constants.sentMessage
                                                    ? Get.find<
                                                            DashboardController>()
                                                        .currentUser
                                                        .account!
                                                        .name
                                                        .toString()
                                                    : Constants.environmentName
                                                        .toString())),
                                        Expanded(
                                            flex: 1,
                                            child: customDetailsItem(
                                                icon: ImagePaths.arrowDown,
                                                title: Strings.to,
                                                color: ColorManager.mainColor,
                                                value: controller.rout ==
                                                        Constants.sentMessage
                                                    ? Constants.environmentName
                                                        .toString()
                                                    : Get.find<
                                                            DashboardController>()
                                                        .currentUser
                                                        .account!
                                                        .name
                                                        .toString()))
                                      ]),
                                  SizedBox(height: 20.h),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: customDetailsItem(
                                                icon: ImagePaths.priority,
                                                title: Strings.priority,
                                                value: GeneralServices
                                                    .getKeyFromValue(
                                                        Constants
                                                            .messagePriorityMap,
                                                        controller.message
                                                            .priorityCode!))),
                                        Expanded(
                                            flex: 1,
                                            child: customDetailsItem(
                                                icon: ImagePaths.deleteCalendar,
                                                title: Strings.sent,
                                                value: controller
                                                    .message.createdOn
                                                    .toString()))
                                      ]),
                                  SizedBox(height: 20.h),
                                  Text(
                                      controller.message.messageBody.toString(),
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: ColorManager.black,
                                          fontWeight: FontWeight.w500,
                                          height: 2.h)),
                                  SizedBox(height: 40.h),
                                  Text(Strings.attachments,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(height: 10.h),
                                  const MessageAttachmentsList(),
                                  SizedBox(height: 20.h),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Divider(
                                              color: ColorManager.mainColor,
                                              height: 3),
                                          SizedBox(height: 20.h),
                                          const LabelTextField(
                                              label: Strings.reply,
                                              isRequired: true),
                                          SizedBox(height: 20.h),
                                          Form(
                                              key: controller.replyKey,
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      color: ColorManager
                                                          .lightGrey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.h)),
                                                  height: 142.h,
                                                  child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.h),
                                                      child: TextFormField(
                                                        maxLines: 7,
                                                        style: TextStyle(
                                                            color: ColorManager
                                                                .black,
                                                            fontSize: 13.sp),
                                                        cursorColor:
                                                            ColorManager
                                                                .mainColor,
                                                        decoration: InputDecoration(
                                                            hintText: Strings
                                                                .replyHint,
                                                            hintStyle: TextStyle(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.7),
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                            contentPadding:
                                                                EdgeInsets.symmetric(
                                                                    vertical:
                                                                        5.h,
                                                                    horizontal:
                                                                        5.w),
                                                            border: InputBorder
                                                                .none),
                                                        controller: controller
                                                            .replyController,
                                                        validator: (value) =>
                                                            value!.isEmpty
                                                                ? ErrorStrings
                                                                    .enterReply
                                                                : null,
                                                      )))),
                                          SizedBox(height: 30.h),
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.h),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(Strings.attachments,
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                                    SizedBox(
                                                        height: 32.h,
                                                        width: 32.w,
                                                        child:
                                                            FloatingActionButton(
                                                                onPressed: () {
                                                                  controller
                                                                      .selectFiles();
                                                                },
                                                                heroTag: null,
                                                                backgroundColor:
                                                                    ColorManager
                                                                        .mainColor,
                                                                child: Icon(
                                                                    Icons.add,
                                                                    color: ColorManager
                                                                        .white,
                                                                    size:
                                                                        20.sp)))
                                                  ])),
                                          SizedBox(height: 10.h),
                                          const MessageUploadedAttachmentsList(),
                                          SizedBox(height: 10.h),
                                          PrimaryButton(
                                              title: Strings.sendReply,
                                              onPressed: () {
                                                controller.reply();
                                              },
                                              height: 40.h,
                                              backgroundColor:
                                                  ColorManager.mainColor,
                                              textAndIconColor:
                                                  ColorManager.white),
                                          SizedBox(height: 20.h)
                                        ])
                                ]))))
              ])),
      Obx(() => Visibility(
          visible: controller.replyLoading.isTrue ? true : false,
          child: const Opacity(
              opacity: 0.8,
              child: ModalBarrier(dismissible: false, color: Colors.black)))),
      Obx(() => Visibility(
          visible: controller.replyLoading.isTrue ? true : false,
          child: const Center(child: SecondCustomLoading())))
    ]));
  }
}

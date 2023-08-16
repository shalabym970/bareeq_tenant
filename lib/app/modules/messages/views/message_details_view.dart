import 'package:Seef/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/constants.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_attachment_widget.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_details_item.dart';
import '../../../services/state_handler.dart';
import '../controllers/message_details_controller.dart';

class MessageDetailsView extends GetView<MessageDetailsController> {
  const MessageDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            BackButton(
              color: ColorManager.mainColor,
            ),
            if (controller.message.direction == true)
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.h),
                        ),
                        color:  controller.message.readStatus == true
                            ? ColorManager.green
                            : ColorManager.red),
                    height: 10.h,
                    width: 10.w,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                    child: Text(
                        controller.message.readStatus == true
                            ? Strings.read
                            : Strings.unread,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: controller.message.readStatus == true
                              ? ColorManager.green
                              : ColorManager.red,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ],
              )
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Strings.subject,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: ColorManager.mainColor)),
                        SizedBox(height: 5.h),
                        Text(controller.message.subject.toString(),
                            style: TextStyle(
                                fontSize: 12.sp, color: ColorManager.black)),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: customDetailsItem(
                              icon: ImagePaths.arrowTop,
                              title: Strings.from,
                              color: ColorManager.mainColor,
                              value: controller.rout == Constants.sentMessage
                                  ? Get.find<DashboardController>()
                                      .currentUser
                                      .account!
                                      .name
                                      .toString()
                                  : Constants.environmentName.toString()),
                        ),
                        Expanded(
                          flex: 1,
                          child: customDetailsItem(
                              icon: ImagePaths.arrowDown,
                              title: Strings.to,
                              color: ColorManager.mainColor,
                              value: controller.rout == Constants.sentMessage
                                  ? Constants.environmentName.toString()
                                  : Get.find<DashboardController>()
                                      .currentUser
                                      .account!
                                      .name
                                      .toString()),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: customDetailsItem(
                              icon: ImagePaths.priority,
                              title: Strings.priority,
                              value: StateHandler.messagePriority(
                                  statusNo: controller.message.priorityCode!)),
                        ),
                        Expanded(
                          flex: 1,
                          child: customDetailsItem(
                              icon: ImagePaths.deleteCalendar,
                              title: Strings.sent,
                              value: controller.message.createdOn.toString()),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      controller.message.messageBody.toString(),
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: ColorManager.black,
                          fontWeight: FontWeight.w500,
                          height: 2.h),
                    ),
                    SizedBox(height: 40.h),
                    Text(
                      Strings.attachments,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 10.h),
                    const CustomAttachmentWidget(
                      svgPrefixIcon: ImagePaths.image,
                    ),
                    SizedBox(height: 20.h),
                    if (controller.rout == Constants.inboxMessage)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            color: ColorManager.mainColor,
                            height: 3,
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            Strings.reply,
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            decoration: BoxDecoration(
                              color: ColorManager.lightGrey,
                              borderRadius: BorderRadius.circular(10.h),
                            ),
                            height: 142.h,
                            child: Padding(
                              padding: EdgeInsets.all(8.h),
                              child: TextFormField(
                                maxLines: 7,
                                style: TextStyle(
                                    color: ColorManager.black, fontSize: 13.sp),
                                cursorColor: ColorManager.mainColor,
                                decoration: InputDecoration(
                                  hintText: Strings.replyHint,
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5.h, horizontal: 5.w),
                                  border: InputBorder.none,
                                ),
                                // controller: controller.detailsEditController,
                                //  validator: (input) =>
                                //  input!.isEmpty ? Strings.insertDetails : null,
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Text(
                            Strings.attachments,
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 10.h),
                          const CustomAttachmentWidget(
                              svgPrefixIcon: ImagePaths.document),
                          SizedBox(height: 30.h),
                          PrimaryButton(
                            title: Strings.attachFiles,
                            onPressed: () {},
                            height: 40.h,
                            backgroundColor: ColorManager.white,
                            textAndIconColor: ColorManager.mainColor,
                            svgIcon: ImagePaths.path68,
                          ),
                          SizedBox(height: 30.h),
                          PrimaryButton(
                            title: Strings.sendReply,
                            onPressed: () {},
                            height: 40.h,
                            backgroundColor: ColorManager.mainColor,
                            textAndIconColor: ColorManager.white,
                          ),
                          SizedBox(height: 20.h),
                        ],
                      )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
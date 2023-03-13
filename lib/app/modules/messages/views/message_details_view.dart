import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/constants.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_attachment_widget.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_details_item.dart';
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
          SizedBox(height: 60.h),
          BackButton(
            color: ColorManager.green,
          ),
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
                        Text(Strings.caseTitle,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: ColorManager.green)),
                        SizedBox(height: 5.h),
                        Text('Insufficient Cementing Material',
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
                              icon: ImagePaths.documentLayout,
                              title: Strings.workPermit,
                              value: 'Aml Corporate'),
                        ),
                        Expanded(
                          flex: 1,
                          child: customDetailsItem(
                              icon: ImagePaths.deleteCalendar,
                              title: Strings.priority,
                              value: '20-April-2022'),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Once the documentation and lease agreement have been finalized, the tenant to • Appoint their fitout team. (Form 2) • Attend formal meeting with SEEF Fit-Out Team to agree on the procedures for Fit-Out • Understand the design criteria and deliverables • Submit fit-out program milestone prior to the submission of conceptual design. (Form 3) • Artwork for hoarding to be submitted for approval.',
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
                        svgPrefixIcon: ImagePaths.document),
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
                            color: ColorManager.green,
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
                                cursorColor: ColorManager.black,
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
                          SizedBox(height: 10.h),
                          const CustomAttachmentWidget(
                            svgPrefixIcon: ImagePaths.image,
                          ),
                          SizedBox(height: 30.h),
                          PrimaryButton(
                            title: Strings.attachFiles,
                            onPressed: () {},
                            height: 40.h,
                            backgroundColor: ColorManager.white,
                            textAndIconColor: ColorManager.darkGreen,
                            svgIcon: ImagePaths.path68,
                          ),
                          SizedBox(height: 30.h),
                          PrimaryButton(
                            title: Strings.sendReply,
                            onPressed: () {},
                            height: 40.h,
                            backgroundColor: ColorManager.darkGreen,
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

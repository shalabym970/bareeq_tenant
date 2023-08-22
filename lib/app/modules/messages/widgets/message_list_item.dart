import 'package:Bareeq/app/services/session_services.dart';
import 'package:Bareeq/common/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/constants.dart';
import '../../../models/message.dart';
import '../../../routes/app_routes.dart';

class MessageListItem extends StatelessWidget {
  const MessageListItem({Key? key, required this.message}) : super(key: key);
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.messagesDetails, arguments: [
              message.direction == true
                  ? Constants.sentMessage
                  : Constants.inboxMessage,
              message
            ]);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.h)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1.h,
                  blurRadius: 3.h,
                  offset: Offset(0, 3.h), // changes position of shadow
                ),
              ],
            ),
            height: 150.h,
            child: Card(
              color: ColorManager.textFieldBg,
              child: Padding(
                padding: EdgeInsets.all(15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                    message.direction == true
                                        ? Get.find<SessionServices>()
                                            .currentUser
                                            .value
                                            .fullName
                                            .toString()
                                        : Constants.environmentName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp,
                                        color: ColorManager.mainColor)),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  message.createdOn.toString(),
                                  style: TextStyle(
                                      color: Colors.grey[800], fontSize: 10.sp),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(message.subject.toString(),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: ColorManager.black.withOpacity(0.7),
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.h),
                                  ),
                                  color: message.regardingName.toString() ==
                                          Constants.caseKey
                                      ? ColorManager.yellow
                                      : message.regardingName.toString() ==
                                              Constants.workPermitKey
                                          ? ColorManager.mainColor
                                          : message.regardingName.toString() ==
                                                  Constants.leaseKey
                                              ? ColorManager.purple
                                              : message.regardingName
                                                          .toString() ==
                                                      Constants.invoiceKey
                                                  ? ColorManager.lightBlue
                                                  : ColorManager.severityColor),
                              height: 8.h,
                              width: 8.w,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                                message.regardingName.toString() ==
                                        Constants.caseKey
                                    ? Strings.case_
                                    : message.regardingName.toString() ==
                                            Constants.workPermitKey
                                        ? Strings.workPermit
                                        : message.regardingName.toString() ==
                                                Constants.leaseKey
                                            ? Strings.lease
                                            : message.regardingName
                                                        .toString() ==
                                                    Constants.invoiceKey
                                                ? Strings.invoice
                                                : Strings.fitOutProcess,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: message.regardingName.toString() ==
                                          Constants.caseKey
                                      ? ColorManager.yellow
                                      : message.regardingName.toString() ==
                                              Constants.workPermitKey
                                          ? ColorManager.mainColor
                                          : message.regardingName.toString() ==
                                                  Constants.leaseKey
                                              ? ColorManager.purple
                                              : message.regardingName
                                                          .toString() ==
                                                      Constants.invoiceKey
                                                  ? ColorManager.lightBlue
                                                  : ColorManager.severityColor,
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      message.messageBody.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: ColorManager.black,
                          height: 1.5.h),
                      maxLines: 1,
                    ),
                    if (message.direction == true)
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.done_all,
                          size: 15.sp,
                          color: message.readStatus == true
                              ? Colors.green
                              : Colors.grey[800],
                        ),
                      )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

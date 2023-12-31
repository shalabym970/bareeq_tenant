import 'package:bareeq/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:bareeq/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/color_manager.dart';
import '../../../../../common/strings/strings.dart';
import '../../../app/models/message.dart';
import '../../../app/services/general_services.dart';
import 'message_card_item.dart';
import 'package:intl/intl.dart' as intl;


class MessageCard extends StatelessWidget {
  const MessageCard({Key? key, required this.message}) : super(key: key);
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Container(
            height: 100.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.h)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0.4,
                      blurRadius: 1,
                      offset: Offset(0, 3.h) // changes position of shadow
                      )
                ]),
            width: 155.w,
            child: Card(
                color: ColorManager.textFieldBg,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MessageCardItem(
                              label: Strings.subject,
                              value: message.subject ?? Strings.na),
                          SizedBox(height: 3.h),
                          MessageCardItem(
                              label: Strings.priority,
                              value: message.priorityCode != null
                                  ? GeneralServices.getKeyFromValue(
                                      Constants.messagePriorityMap,
                                      message.priorityCode!)
                                  : Strings.na),
                          SizedBox(height: 3.h),
                          MessageCardItem(
                              label: Strings.from,
                              value: message.direction == true
                                  ? Get.find<DashboardController>()
                                          .currentUser
                                          .account!
                                          .name ??
                                      Strings.na
                                  : Constants.environmentName),
                          SizedBox(height: 5.h),
                          Expanded(
                              child: Text(message.messageBody.toString(),
                                  style: TextStyle(
                                      height: 1.5.h,
                                      fontSize: 9.sp,
                                      color: ColorManager.black),
                                  maxLines: 4,
                                  overflow: TextOverflow.visible)),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        message.createdOn != null
                                            ? intl.DateFormat('EEE d MMM y')
                                                .format(message.createdOn!)
                                                .toString()
                                            : Strings.na,
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 9.sp))),
                                if (message.direction == true)
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(Icons.done_all,
                                          size: 17.sp,
                                          color: message.readStatus == true
                                              ? Colors.grey[800]
                                              : Colors.green))
                              ])
                        ])))));
  }
}

import 'package:Seef/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:Seef/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../services/state_handler.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings/strings.dart';
import '../../../models/message.dart';
import 'message_card_item.dart';

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
                offset: Offset(0, 3.h), // changes position of shadow
              ),
            ],
          ),
          width: 155.w,
          child: Card(
            color: ColorManager.textFieldBg,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MessageCardItem(
                      label: Strings.subject,
                      value: message.subject.toString()),
                  SizedBox(
                    height: 5.h,
                  ),
                  MessageCardItem(
                      label: Strings.priority,
                      value: StateHandler.messagePriority(
                          statusNo: message.priorityCode!)),
                  SizedBox(
                    height: 5.h,
                  ),
                  MessageCardItem(
                      label: Strings.from,
                      value: message.direction == true
                          ? Get.find<DashboardController>()
                              .currentUser
                              .account!
                              .name!
                          : Constants.environmentName),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: Text(
                      message.messageBody.toString(),
                      style: TextStyle(
                          height: 2.h,
                          fontSize: 12.sp,
                          color: ColorManager.black),
                      maxLines: 3,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  if (message.direction == true)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.done_all,
                        size: 20.sp,
                        color: message.readStatus == true
                            ? Colors.green
                            : Colors.grey[800],
                      ),
                    )
                ],
              ),
            ),
          ),
        ));
  }
}
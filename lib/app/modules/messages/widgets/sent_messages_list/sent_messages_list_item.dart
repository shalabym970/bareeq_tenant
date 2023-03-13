import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/color_manager.dart';
import '../../../../../common/constants.dart';
import '../../../../routes/app_routes.dart';
import '../../views/message_details_view.dart';

class SentMessagesListItem extends StatelessWidget {
  const SentMessagesListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.messagesDetails,
                arguments: Constants.sentMessage);
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
            height: 142.h,
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
                            Text('Amal Ragab Gad',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                    color: ColorManager.green)),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text('Welcome to Tenant Protal',
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
                                  color: ColorManager.purple),
                              height: 8.h,
                              width: 8.w,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text('Lease',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: ColorManager.purple,
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        )
                      ],
                    ),
                    Text(
                      'Once the documentation and lease agreement have been finalized, the tenant to • Appoint their fitout team. (Form 2) • Attend formal meeting with SEEF Fit-Out Team to agree on the procedures for Fit-Out • Understand the design criteria and deliverables • Submit fit-out program milestone prior to the submission of conceptual design. (Form 3) • Artwork for hoarding to be submitted for approval.',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: ColorManager.black,
                          height: 2.h),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

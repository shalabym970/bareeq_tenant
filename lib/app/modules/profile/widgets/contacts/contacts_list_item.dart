import 'package:Bareeq/app/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common/color_manager.dart';
import '../../../../../common/strings/strings.dart';

class ContactsListItem extends StatelessWidget {
  const ContactsListItem({Key? key, required this.contact}) : super(key: key);
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: GestureDetector(
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.h)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1.h,
                          blurRadius: 3.h,
                          offset: Offset(0, 3.h) // changes position of shadow
                          )
                    ]),
                height: 116.h,
                child: Card(
                    color: ColorManager.textFieldBg,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Row(children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(children: [
                                    Text(Strings.fullName,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                            color: ColorManager.mainColor)),
                                    SizedBox(height: 5.h),
                                    Text(contact.fullName ?? Strings.na,
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: ColorManager.black),
                                        maxLines: 1)
                                  ]),
                                  Column(children: [
                                    Text(Strings.email,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                            color: ColorManager.mainColor)),
                                    SizedBox(height: 5.h),
                                    Text(contact.emailAddress ?? Strings.na,
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: ColorManager.black),
                                        maxLines: 1)
                                  ])
                                ])),
                        Expanded(
                            flex: 1,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(Strings.businessPhone,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.sp,
                                          color: ColorManager.mainColor)),
                                  SizedBox(height: 5.h),
                                  Text(contact.businessPhone ?? Strings.na,
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: ColorManager.black))
                                ])),
                        Expanded(
                            flex: 1,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(children: [
                                    Text(Strings.jobTitle,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                            color: ColorManager.mainColor)),
                                    SizedBox(height: 5.h),
                                    Text(contact.jobTile ?? Strings.na,
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: ColorManager.black))
                                  ]),
                                  Column(children: [
                                    Text(Strings.mobileNumber,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                            color: ColorManager.mainColor)),
                                    SizedBox(height: 5.h),
                                    Text(contact.mobilePhone ?? Strings.na,
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: ColorManager.black))
                                  ])
                                ]))
                      ]),
                    )))));
  }
}

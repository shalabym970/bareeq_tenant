import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/color_manager.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../routes/app_routes.dart';

class ContactsListItem extends StatelessWidget {
  const ContactsListItem({Key? key}) : super(key: key);

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
              offset: Offset(0, 3.h), // changes position of shadow
            ),
          ],
        ),
        height: 116.h,
        child: Card(
          color: ColorManager.textFieldBg,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(Strings.fullName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: ColorManager.green)),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text('Amal Ragab Gad',
                            style: TextStyle(
                                fontSize: 12.sp, color: ColorManager.black))
                      ],
                    ),
                    Column(
                      children: [
                        Text(Strings.email,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: ColorManager.green)),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text('aml@aml.com',
                            style: TextStyle(
                                fontSize: 12.sp, color: ColorManager.black))
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(Strings.businessPhone,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                            color: ColorManager.green)),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text('06161616161',
                        style: TextStyle(
                            fontSize: 12.sp, color: ColorManager.black))
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          Strings.jobTitle,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                              color: ColorManager.green),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text('Engineer',
                            style: TextStyle(
                                fontSize: 12.sp, color: ColorManager.black))
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          Strings.mobileNumber,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                              color: ColorManager.green),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text('01212121212',
                            style: TextStyle(
                                fontSize: 12.sp, color: ColorManager.black))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

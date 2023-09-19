import 'package:bareeq/app/models/leased_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import '../../../../../common/color_manager.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../routes/app_routes.dart';
import '../../controllers/dashboard_controller.dart';

class PropertyListItem extends GetView<DashboardController> {
  const PropertyListItem({Key? key, required this.lease}) : super(key: key);
  final LeasedProperty lease;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.toNamed(Routes.leasedPropertyDetails, arguments: lease);
        },
        child: Padding(
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
                              offset:
                                  Offset(0, 3.h) // changes position of shadow
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
                                          Text(Strings.propertyName,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10.sp,
                                                  color:
                                                      ColorManager.mainColor),
                                              maxLines: 1),
                                          SizedBox(height: 3.h),
                                          Text(lease.name ?? Strings.na,
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: ColorManager.black),
                                              maxLines: 1)
                                        ]),
                                        Column(children: [
                                          Text(Strings.dueDate,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10.sp,
                                                  color:
                                                      ColorManager.mainColor),
                                              maxLines: 1),
                                          SizedBox(height: 3.h),
                                          Text(
                                              lease.endDate != null
                                                  ? intl.DateFormat(
                                                          'EEE d MMM y')
                                                      .format(lease.endDate!)
                                                      .toString()
                                                  : Strings.na,
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: ColorManager.black),
                                              maxLines: 1)
                                        ])
                                      ])),
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(Strings.submitDate,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.sp,
                                                color: ColorManager.mainColor),
                                            maxLines: 1),
                                        SizedBox(height: 3.h),
                                        Text(
                                            lease.startDate != null
                                                ? intl.DateFormat('EEE d MMM y')
                                                    .format(lease.startDate!)
                                                    .toString()
                                                : Strings.na,
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                color: ColorManager.black),
                                            maxLines: 1)
                                      ])),
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(children: [
                                          Text(Strings.accountName,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10.sp,
                                                  color:
                                                      ColorManager.mainColor),
                                              maxLines: 1),
                                          SizedBox(height: 3.h),
                                          Text(
                                              controller.currentUser.account
                                                      ?.name ??
                                                  Strings.na,
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: ColorManager.black),
                                              maxLines: 1)
                                        ]),
                                        Column(children: [
                                          Text(Strings.amount,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10.sp,
                                                  color:
                                                      ColorManager.mainColor),
                                              maxLines: 1),
                                          SizedBox(height: 5.h),
                                          Text(
                                              lease.amount != null
                                                  ? lease.amount.toString()
                                                  : Strings.na,
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: ColorManager.black),
                                              maxLines: 1)
                                        ])
                                      ])),
                            ])))))));
  }
}

import 'package:bareeq/app/models/sold_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import '../../../../../common/color_manager.dart';
import '../../../../../common/constants.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../routes/app_routes.dart';
import '../../../../services/general_services.dart';
import '../../controllers/properties_controller.dart';

class SoldPropertyItem extends GetView<PropertiesController> {
  const SoldPropertyItem({Key? key, required this.soldProperty})
      : super(key: key);
  final SoldProperty soldProperty;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.toNamed(Routes.soldPropertyDetails, arguments: soldProperty);
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
                                          Text(soldProperty.name ?? Strings.na,
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: ColorManager.black),
                                              maxLines: 1)
                                        ]),
                                        Column(children: [
                                          Text(Strings.agreemntDate,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10.sp,
                                                  color:
                                                      ColorManager.mainColor),
                                              maxLines: 1),
                                          SizedBox(height: 3.h),
                                          Text(
                                              soldProperty.agreementDate != null
                                                  ? intl.DateFormat(
                                                          'EEE d MMM y')
                                                      .format(soldProperty
                                                          .agreementDate!)
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
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(children: [
                                          Text(Strings.agreementRef,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10.sp,
                                                  color:
                                                      ColorManager.mainColor),
                                              maxLines: 1),
                                          SizedBox(height: 3.h),
                                          Text(
                                              soldProperty.agreementRef ??
                                                  Strings.na,
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: ColorManager.black),
                                              maxLines: 1)
                                        ]),
                                        Column(children: [
                                          Text(Strings.status,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10.sp,
                                                  color:
                                                      ColorManager.mainColor),
                                              maxLines: 1),
                                          SizedBox(height: 3.h),
                                          Text(
                                              soldProperty.agreementStatus !=
                                                      null
                                                  ? GeneralServices.getKeyFromValue(
                                                      Constants
                                                          .soldPropertyStatusMap,
                                                      soldProperty
                                                          .agreementStatus!)
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
                                          Text(Strings.transferDate,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10.sp,
                                                  color:
                                                      ColorManager.mainColor),
                                              maxLines: 1),
                                          SizedBox(height: 3.h),
                                          Text(
                                              soldProperty.transferDate != null
                                                  ? intl.DateFormat(
                                                          'EEE d MMM y')
                                                      .format(soldProperty
                                                          .transferDate!)
                                                      .toString()
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

import 'package:bareeq/app/models/case_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import '../../../../../common/color_manager.dart';
import '../../../../../common/constants.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../routes/app_routes.dart';
import '../../../../services/general_services.dart';
import '../../controllers/dashboard_controller.dart';

class CasesListItem extends GetView<DashboardController> {
  const CasesListItem({Key? key, required this.cases}) : super(key: key);
  final Case cases;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.toNamed(Routes.caseDetails, arguments: cases);
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
                              offset: Offset(0, 3.h))
                        ]),
                    height: 116.h,
                    child: Card(
                        color: ColorManager.textFieldBg,
                        child: Row(children: [
                          Expanded(
                              flex: 1,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text(Strings.requestNumber,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.sp,
                                                color: ColorManager.mainColor)),
                                        SizedBox(height: 3.h),
                                        Text(cases.caseNumber ?? Strings.na,
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                color: ColorManager.black))
                                      ],
                                    ),
                                    Column(children: [
                                      Text(Strings.type,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.sp,
                                              color: ColorManager.mainColor)),
                                      SizedBox(height: 3.h),
                                      Text(
                                          cases.type != null
                                              ? GeneralServices.getKeyFromValue(
                                                  Constants.caseTypesMap,
                                                  cases.type!)
                                              : Strings.na,
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              color: ColorManager.black))
                                    ])
                                  ])),
                          Expanded(
                              flex: 1,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          Strings.title,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.sp,
                                              color: ColorManager.mainColor),
                                        ),
                                        SizedBox(height: 3.h),
                                        Text(cases.title ?? Strings.na,
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                color: ColorManager.black))
                                      ],
                                    ),
                                    Column(children: [
                                      Text(
                                        Strings.priority,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                            color: ColorManager.mainColor),
                                      ),
                                      SizedBox(height: 3.h),
                                      Text(
                                          cases.priority != null
                                              ? GeneralServices.getKeyFromValue(
                                                  Constants.casePriorityMap,
                                                  cases.priority!)
                                              : Strings.na,
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              color: ColorManager.black))
                                    ])
                                  ])),
                          Expanded(
                              flex: 1,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(Strings.date,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                            color: ColorManager.mainColor)),
                                    SizedBox(height: 3.h),
                                    Text(
                                        cases.submittedOn != null
                                            ? intl.DateFormat('EEE d MMM y')
                                                .format(cases.submittedOn!)
                                                .toString()
                                            : Strings.na,
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: ColorManager.black))
                                  ]))
                        ]))))));
  }
}

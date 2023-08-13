import 'package:Seef/app/models/fit_out_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/color_manager.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../routes/app_routes.dart';
import 'package:intl/intl.dart';
import '../../../../services/state_handler.dart';
import '../../controllers/dashboard_controller.dart';

class FitOutProcessesListItem extends GetView<DashboardController> {
  const FitOutProcessesListItem({Key? key, required this.fitOut})
      : super(key: key);
  final FitOutModel fitOut;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.fitOutDetails, arguments: fitOut);
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
                          Text(Strings.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                  color: ColorManager.mainColor)),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(fitOut.name.toString(),
                              style: TextStyle(
                                  fontSize: 12.sp, color: ColorManager.black))
                        ],
                      ),
                      Column(
                        children: [
                          Text(Strings.completeDate,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                  color: ColorManager.mainColor)),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                              fitOut.completedDate == null
                                  ? Strings.na
                                  : DateFormat("EEE d MMM y")
                                      .format(fitOut.completedDate!),
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            Strings.openingDate,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: ColorManager.mainColor),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                              fitOut.expectedOpeningDate == null
                                  ? Strings.na
                                  : DateFormat("EEE d MMM y")
                                      .format(fitOut.expectedOpeningDate!),
                              style: TextStyle(
                                  fontSize: 12.sp, color: ColorManager.black))
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            Strings.status,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: ColorManager.mainColor),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                              StateHandler.fitOutStatus(
                                  statusNo: fitOut.status ?? 0),
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
                      Text(Strings.startDate,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                              color: ColorManager.mainColor)),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                          fitOut.startDate == null
                              ? Strings.na
                              : DateFormat("EEE d MMM y")
                                  .format(fitOut.startDate!),
                          style: TextStyle(
                              fontSize: 12.sp, color: ColorManager.black))
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}

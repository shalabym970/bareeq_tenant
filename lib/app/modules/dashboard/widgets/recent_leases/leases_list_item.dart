import 'package:Seef/app/models/lease_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import '../../../../../common/color_manager.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../routes/app_routes.dart';
import '../../controllers/dashboard_controller.dart';

class LeasesListItem extends GetView<DashboardController> {
  const LeasesListItem({Key? key, required this.lease}) : super(key: key);
  final LeaseModel lease;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.leaseDetails, arguments: lease);
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
                          Text(Strings.leaseCRMNumber,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                  color: ColorManager.mainColor)),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(lease.name.toString(),
                              style: TextStyle(
                                  fontSize: 12.sp, color: ColorManager.black))
                        ],
                      ),
                      Column(
                        children: [
                          Text(Strings.dueDate,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                  color: ColorManager.mainColor)),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                              lease.endDate == null
                                  ? Strings.na
                                  : intl.DateFormat('EEE d MMM y')
                                      .format(lease.endDate!)
                                      .toString(),
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
                            Strings.leaseName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: ColorManager.mainColor),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(controller.currentUser.account!.name.toString(),
                              style: TextStyle(
                                  fontSize: 12.sp, color: ColorManager.black))
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            Strings.amount,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: ColorManager.mainColor),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(lease.amount.toString(),
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
                      Text(Strings.submitDate,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                              color: ColorManager.mainColor)),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                          lease.startDate == null
                              ? Strings.na
                              : intl.DateFormat('EEE d MMM y')
                                  .format(lease.startDate!)
                                  .toString(),
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

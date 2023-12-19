import 'package:bareeq/app/models/fit_out_step_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/color_manager.dart';
import '../../../../../common/constants.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../routes/app_routes.dart';
import '../../../../services/general_services.dart';
import '../../controllers/fit_out_process_details_controller.dart';

class FitOutStepItem extends GetView<FitOutProcessDetailsController> {
  const FitOutStepItem({Key? key, required this.fitOutStep}) : super(key: key);
  final FitOutStepModel fitOutStep;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.toNamed(Routes.activity, arguments: fitOutStep);
        },
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
            width: 157.h,
            child: Card(
                color: ColorManager.textFieldBg,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                              fitOutStep.fitOutStepTask!.first.subject ??
                                  Strings.na,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                  color: ColorManager.mainColor),
                              maxLines: 1),
                          SizedBox(height: 5.h),
                          Text(
                              fitOutStep.status != null
                                  ? GeneralServices.getKeyFromValue(
                                      Constants.fitOuTStepsTypesMap,
                                      fitOutStep.status!)
                                  : Strings.na,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: ColorManager.mainColor)),
                          SizedBox(height: 10.h),
                          Expanded(
                              child: Text(fitOutStep.description ?? Strings.na,
                                  style: TextStyle(
                                      height: 1.5.h,
                                      fontSize: 9.sp,
                                      color: ColorManager.black),
                                  maxLines: 5,
                                  overflow: TextOverflow.visible))
                        ])))));
  }
}

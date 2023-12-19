import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_details_app_bar.dart';
import '../../../../common/widgets/no_internet_connection_widget.dart';
import '../controllers/fit_out_process_details_controller.dart';
import '../widgets/Fit_out_process_dates_widget.dart';
import '../widgets/Fit_out_process_general_details.dart';
import '../widgets/fit_out_messages_list.dart';
import '../widgets/fit_out_steps/fit_out_process_steps_list.dart';

class FitOutProcessDetailsView extends GetView<FitOutProcessDetailsController> {
  const FitOutProcessDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.connectionController.isConnected.isTrue
        ? RefreshIndicator(
        color: ColorManager.mainColor,
        onRefresh: () async {
          controller.onInit();
        },
        child: Scaffold(
          appBar: customDetailsAppBar(
              title:
                  "${Strings.fitOutProcess} (${controller.fitOut.name ?? Strings.na})"),
          body: Padding(
              padding: EdgeInsets.only(right: 10.w, left: 10.w),
              child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        Padding(
                            padding: EdgeInsets.all(10.h),
                            child: Row(children: [
                              SvgPicture.asset(ImagePaths.settings,
                                  height: 24.h, width: 26.w),
                              SizedBox(width: 10.w),
                              Expanded(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                    Text(Strings.fitOutProcessTitle,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                            color: ColorManager.mainColor)),
                                    SizedBox(height: 5.h),
                                    Text(controller.fitOut.name ?? Strings.na,
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: ColorManager.black))
                                  ]))
                            ])),
                        const FitOutProcessGeneralDetailsWidget(),
                        const FitOutProcessDatesWidget(),
                        SizedBox(height: 20.h),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.h),
                            child: Text(
                              Strings.fitOutSteps,
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w400),
                            )),
                        SizedBox(
                            height: 185.h,
                            child: const FitOutProcessStepsList()),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.h),
                            child: Text(Strings.messages,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400))),
                        SizedBox(
                            height: 185.h, child: const FitOutMessagesList()),
                        SizedBox(height: 50.h)
                      ]))),
        ))  : const NoInternetConnectionView());
  }
}

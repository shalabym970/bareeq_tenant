import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../routes/app_routes.dart';
import '../controllers/fit_out_process_details_controller.dart';
import '../widgets/Fit_out_process_dates_widget.dart';
import '../widgets/Fit_out_process_general_details.dart';
import '../widgets/fit_out_messages_list.dart';
import '../widgets/fit_out_steps/Fit_out_process_steps_list.dart';

class FitOutProcessDetailsView extends GetView<FitOutProcessDetailsController> {
  const FitOutProcessDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  RefreshIndicator(
        color: ColorManager.mainColor,
        onRefresh: () async {
      controller.onInit();
    },
    child: Scaffold(
      appBar: customAppBar(title: Strings.fitOutProcess),
      body: Padding(
        padding: EdgeInsets.only(right: 10.w, left: 10.w),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.all(10.h),
                child: Row(
                  children: [
                    SvgPicture.asset(ImagePaths.settings,
                        height: 24.h, width: 26.w),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Strings.fitOutProcessTitle,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: ColorManager.mainColor)),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(controller.fitOut.name.toString(),
                            style: TextStyle(
                                fontSize: 18.sp, color: ColorManager.black))
                      ],
                    ),
                  ],
                ),
              ),
              const FitOutProcessGeneralDetailsWidget(),
              const FitOutProcessDatesWidget(),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: Text(
                  Strings.fitOutSteps,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 185.h, child: const FitOutProcessStepsList()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.messages,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 32.h,
                      width: 32.w,
                      child: FloatingActionButton(
                        onPressed: () {
                          Get.toNamed(Routes.createMessage);
                        },
                        heroTag: null,
                        backgroundColor: ColorManager.mainColor,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 185.h, child: const FitOutMessagesList()),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
      drawer:
          customDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}

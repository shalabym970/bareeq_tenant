import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:property_pro/common/color_manager.dart';
import 'package:property_pro/common/images_paths.dart';
import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../controllers/fit_out_process_details_controller.dart';
import '../widgets/Fit_out_process_dates_widget.dart';
import '../widgets/Fit_out_process_general_details.dart';
import '../widgets/Fit_out_process_messages_list.dart';
import '../widgets/Fit_out_process_steps_list.dart';

class FitOutProcessDetailsView extends GetView<FitOutProcessDetailsController> {
  const FitOutProcessDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: Strings.fitOutProcess),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          heroTag: null,
          backgroundColor: ColorManager.primaryBTNColorBrown,
          child: SvgPicture.asset(ImagePaths.save, height: 20.h, width: 20.w)),

      body: Padding(
        padding: EdgeInsets.only(right: 10.w, left: 10.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
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
                                color: ColorManager.darkBlue)),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text('FOP-34860-20-001',
                            style: TextStyle(
                                fontSize: 18.sp, color: ColorManager.black))
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              const FitOutProcessGeneralDetailsWidget(),
              SizedBox(height: 20.h),
              const FitOutProcessDatesWidget(),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: Text(
                  Strings.fitOutSteps,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(height: 185.h, child:const FitOutProcessStepsList()),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: Text(
                  Strings.messages,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
              ),

              SizedBox(height: 10.h),
              SizedBox(height: 185.h, child: const FitOutProcessMessagesList()),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),

      drawer:
          CustomDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

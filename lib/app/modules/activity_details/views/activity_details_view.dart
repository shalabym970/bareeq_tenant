import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_attachment_widget.dart';
import '../../../../common/widgets/custom_btn.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../routes/app_routes.dart';
import '../controllers/activity_details_controller.dart';
import '../widgets/activity_general_details.dart';
import '../widgets/activity_messages_list.dart';
import '../widgets/activity_remarks.dart';

class ActivityDetailsView extends GetView<ActivityDetailsController> {
  const ActivityDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: Strings.activity),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.offAllNamed(Routes.dashboard);
          },
          heroTag: null,
          backgroundColor: ColorManager.mainColor,
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
                    SvgPicture.asset(ImagePaths.drill,
                        height: 24.h, width: 26.w),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Strings.activityTitle,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: ColorManager.mainColor)),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text('Organize Fit-out Meeting Kick off',
                            style: TextStyle(
                                fontSize: 15.sp, color: ColorManager.black))
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              const ActivityGeneralDetailsWidget(),
              SizedBox(height: 20.h),
              const ActivityRemarks(),
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
              SizedBox(height: 185.h, child: const ActivityMessagesList()),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: Text(
                  Strings.attachments,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 10.h),
              const CustomAttachmentWidget(),
              SizedBox(height: 10.h),
              const CustomAttachmentWidget(),
              SizedBox(height: 20.h),
              PrimaryButton(
                title: Strings.attachFiles,
                onPressed: () {},
                height: 40.h,
                backgroundColor: ColorManager.white,
                textAndIconColor: ColorManager.mainColor,
                svgIcon: ImagePaths.path68,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),

      drawer:
          customDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

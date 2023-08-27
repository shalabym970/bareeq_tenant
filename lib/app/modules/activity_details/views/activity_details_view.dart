import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/attachament_title_public_widget.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../routes/app_routes.dart';
import '../controllers/activity_details_controller.dart';
import '../widgets/activity_attachment_list.dart';
import '../widgets/activity_general_details.dart';
import '../widgets/activity_messages_list.dart';
import '../widgets/activity_remarks.dart';

class ActivityDetailsView extends GetView<ActivityDetailsController> {
  const ActivityDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        color: ColorManager.mainColor,
        onRefresh: () async {
          controller.onInit();
        },
        child: Scaffold(
          appBar: customAppBar(title: Strings.activity),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.offAllNamed(Routes.dashboard);
              },
              heroTag: null,
              backgroundColor: ColorManager.mainColor,
              child:
                  SvgPicture.asset(ImagePaths.save, height: 20.h, width: 20.w)),

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
                        Expanded(
                            child: Column(
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
                            Text(
                              controller
                                  .fitOutStep.fitOutStepTask!.first.subject
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 15.sp, color: ColorManager.black),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        )),
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
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(height: 185.h, child: const ActivityMessagesList()),
                  SizedBox(height: 20.h),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AttachmentTitlePublicWidget(),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.h),
                            child: SizedBox(
                                height: 32.h,
                                width: 32.w,
                                child: FloatingActionButton(
                                    onPressed: () {},
                                    heroTag: null,
                                    backgroundColor: ColorManager.mainColor,
                                    child: Icon(Icons.add,
                                        color: ColorManager.white,
                                        size: 20.sp))))
                      ]),
                  SizedBox(height: 10.h),
                  const ActivityAttachmentsList(),
                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ),

          drawer:
              customDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
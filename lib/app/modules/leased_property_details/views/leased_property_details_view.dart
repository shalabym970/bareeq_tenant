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
import '../controllers/leased_property_details_controller.dart';
import '../widgets/leased_property_attachments_list.dart';
import '../widgets/leased_property_dates_widget.dart';
import '../widgets/leased_property_general_details.dart';
import '../widgets/leased_property_messages_list.dart';
import '../widgets/leased_property_unit_details.dart';

class LeasedPropertyDetailsView extends GetView<LeasedPropertyDetailsController> {
  const LeasedPropertyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        color: ColorManager.mainColor,
        onRefresh: () async {
          controller.onInit();
        },
        child: Scaffold(
          appBar: customAppBar(title: Strings.property),

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
                        SvgPicture.asset(ImagePaths.group77,
                            height: 24.h, width: 26.w),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Strings.propertyTitle,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                    color: ColorManager.mainColor)),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(controller.lease.name ?? Strings.na,
                                style: TextStyle(
                                    fontSize: 15.sp, color: ColorManager.black))
                          ],
                        )),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  const LeasedPropertyGeneralDetailsWidget(),
                  SizedBox(height: 20.h),
                  const LeasedPropertyUnitDetailsWidget(),
                  SizedBox(height: 20.h),
                  const LeasedPropertyDatesWidget(),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: Text(
                      Strings.messages,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(height: 185.h, child: const LeasedPropertyMessagesList()),
                  SizedBox(height: 20.h),
                  const AttachmentTitlePublicWidget(),
                  SizedBox(height: 10.h),
                  const LeasedPropertyAttachmentsList(),
                  SizedBox(height: 100.h),
                ]
              )
            )
          ),
          drawer:
              customDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}

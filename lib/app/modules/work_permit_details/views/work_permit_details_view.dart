import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:property_pro/app/modules/work_permit_details/widgets/work_permit_comments_list.dart';
import 'package:property_pro/app/modules/work_permit_details/widgets/work_permit_description.dart';
import 'package:property_pro/app/modules/work_permit_details/widgets/work_permit_general_details.dart';
import 'package:property_pro/app/modules/work_permit_details/widgets/work_permit_items_list.dart';
import 'package:property_pro/app/modules/work_permit_details/widgets/work_permit_messages_list.dart';
import 'package:property_pro/app/modules/work_permit_details/widgets/work_permit_work_status.dart';
import 'package:property_pro/common/color_manager.dart';
import 'package:property_pro/common/images_paths.dart';
import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_attachment_widget.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../controllers/work_permit_details_controller.dart';

class WorkPermitDetailsView extends GetView<WorkPermitDetailsController> {
  const WorkPermitDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: Strings.workPermit),
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
                    SvgPicture.asset(ImagePaths.officeBag,
                        height: 24.h, width: 26.w),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Strings.subject,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: ColorManager.darkBlue)),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text('WP--21--018',
                            style:
                                TextStyle(fontSize: 18.sp, color: ColorManager.black))
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              const WorkPermitGeneralDetailsWidget(),
              SizedBox(height: 20.h),
              const WorkPermitWorkStatusWidget(),
              SizedBox(height: 20.h),
              const WorkPermitDescription(),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  Strings.seefComments,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(height: 185.h, child: const WorkPermitsCommentsList()),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  Strings.workPermitItems,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(height: 185.h, child: const WorkPermitsItemsList()),
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
              SizedBox(height: 185.h, child: const WorkPermitsMessagesList()),
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
            ],
          ),
        ),
      ),

      drawer:
          CustomDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

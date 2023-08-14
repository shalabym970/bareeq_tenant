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
import '../controllers/work_permit_details_controller.dart';
import '../../../../common/widgets/paragraph_widget.dart';
import '../widgets/work_permit_general_details.dart';
import '../widgets/work_permit_items/work_permit_items_list.dart';
import '../widgets/work_permit_messages_list.dart';
import '../widgets/work_permit_work_status.dart';

class WorkPermitDetailsView extends GetView<WorkPermitDetailsController> {
  const WorkPermitDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        color: ColorManager.mainColor,
        onRefresh: () async {
          controller.onInit();
        },
        child: Scaffold(
          appBar: customAppBar(title: Strings.workPermit),
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
              physics: const AlwaysScrollableScrollPhysics(),
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
                                    color: ColorManager.mainColor)),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(controller.workPermit.subject.toString(),
                                style: TextStyle(
                                    fontSize: 18.sp, color: ColorManager.black))
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
                  ParagraphWidget(
                      title: Strings.description,
                      description:
                          "- ${controller.workPermit.description.toString()}"),
                  ParagraphWidget(
                      title: Strings.comment,
                      description:
                          "- ${controller.workPermit.comment.toString()}"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.workPermitItems,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 32.h,
                          width: 32.w,
                          child: FloatingActionButton(
                            onPressed: () {
                              Get.toNamed(Routes.createWorkPermitItem);
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
                  SizedBox(height: 10.h),
                  SizedBox(height: 185.h, child: const WorkPermitsItemsList()),
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
                  SizedBox(
                      height: 185.h, child: const WorkPermitMessagesList()),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: Text(
                      Strings.attachments,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const CustomAttachmentWidget(
                    svgPrefixIcon: ImagePaths.document,
                  ),
                  SizedBox(height: 10.h),
                  const CustomAttachmentWidget(
                    svgPrefixIcon: ImagePaths.image,
                  ),
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
        ));
  }
}

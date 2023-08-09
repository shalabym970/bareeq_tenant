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
import '../controllers/case_details_controller.dart';
import '../widgets/case_description.dart';
import '../widgets/case_general_details.dart';
import '../widgets/case_messages_list.dart';
import '../widgets/case_unit_details.dart';

class CaseDetailsView extends GetView<CaseDetailsController> {
  const CaseDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: Strings.case_),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.offAllNamed(Routes.dashboard);
          },
          heroTag: null,
          backgroundColor: ColorManager.darkGreen,
          child: SvgPicture.asset(ImagePaths.save, height: 20.h, width: 20.w)),
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
                    SvgPicture.asset(ImagePaths.group86,
                        height: 24.h, width: 26.w),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Strings.caseTitle,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: ColorManager.green)),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(controller.cases.title.toString(),
                            style: TextStyle(
                                fontSize: 18.sp, color: ColorManager.black))
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              const CaseGeneralDetailsWidget(),
              SizedBox(height: 20.h),
              const CaseUnitDetailsWidget(),
              SizedBox(height: 20.h),
              const CaseDescription(),
              SizedBox(height: 20.h),
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
                        backgroundColor: ColorManager.darkGreen,
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
              SizedBox(height: 185.h, child: const CaseMessagesList()),
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
              const CustomAttachmentWidget(svgPrefixIcon: ImagePaths.document),
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
                textAndIconColor: ColorManager.darkGreen,
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

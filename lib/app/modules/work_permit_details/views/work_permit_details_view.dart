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
import '../../../../common/widgets/second_custom_loading.dart';
import '../../../../common/widgets/ui.dart';
import '../../../routes/app_routes.dart';
import '../controllers/work_permit_details_controller.dart';
import '../../../../common/widgets/paragraph_widget.dart';
import '../widgets/attachments/cpr_card_attachment.dart';
import '../widgets/attachments/insurance_attachment.dart';
import '../widgets/attachments/method_statement_attachment.dart';
import '../widgets/attachments/risk_assessment_attachment.dart';
import '../widgets/work_permit_general_details.dart';
import '../widgets/work_permit_items/work_permit_items_list.dart';
import '../widgets/work_permit_messages_list.dart';
import '../widgets/work_permit_work_status.dart';

class WorkPermitDetailsView extends GetView<WorkPermitDetailsController> {
  const WorkPermitDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (controller.submitLoading.isTrue) {
            return false;
          } else {
            if (controller.cprFile.value != null ||
                controller.insuranceFile.value != null ||
                controller.methodFile.value != null ||
                controller.riskFile.value != null) {
              Ui.confirmDialog(
                  middleText: Strings.saveWorkPermitData,
                  confirmBtnTitle: Strings.save,
                  onSave: () {
                    Get.back();
                    controller.saveWorkPermit();
                  },
                  onDiscard: () {
                    Get.back();
                    Get.back();
                    //   Get.until((route) => route.isFirst);
                  },
                  title: Strings.confirm);
            }
            return true;
          }
        },
        child: RefreshIndicator(
            color: ColorManager.mainColor,
            onRefresh: () async {
              controller.onInit();
            },
            child: Scaffold(
              appBar: customAppBar(title: Strings.workPermit),
              floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    controller.saveWorkPermit();
                  },
                  heroTag: null,
                  backgroundColor: ColorManager.mainColor,
                  child: SvgPicture.asset(ImagePaths.save,
                      height: 20.h, width: 20.w)),

              body: Stack(children: [
                Padding(
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
                              Expanded(
                                  child: Column(
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
                                          fontSize: 15.sp,
                                          color: ColorManager.black))
                                ],
                              )),
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
                                "- ${controller.workPermit.comment ?? Strings.na}"),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Strings.workPermitItems,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 32.h,
                                width: 32.w,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.createWorkPermitItem,
                                        arguments: controller.workPermit);
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
                        SizedBox(
                            height: 185.h, child: const WorkPermitsItemsList()),
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
                            height: 185.h,
                            child: const WorkPermitMessagesList()),
                        SizedBox(height: 10.h),
                        const AttachmentTitlePublicWidget(),
                        SizedBox(height: 20.h),
                        const CprCardAttachment(),
                        const InsuranceAttachment(),
                        const MethodStatementAttachment(),
                        const RiskAssessmentAttachment(),
                        SizedBox(height: 100.h),
                      ],
                    ),
                  ),
                ),
                Obx(() => Visibility(
                    visible: controller.submitLoading.isTrue ? true : false,
                    child: const Opacity(
                        opacity: 0.8,
                        child: ModalBarrier(
                            dismissible: false, color: Colors.black)))),
                Obx(() => Visibility(
                    visible: controller.submitLoading.isTrue ? true : false,
                    child: const Center(child: SecondCustomLoading())))
              ]),

              drawer:
                  customDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/attachament_title_public_widget.dart';
import '../../../../common/widgets/custom_details_app_bar.dart';
import '../../../../common/widgets/no_internet_connection_widget.dart';
import '../../../../common/widgets/second_custom_loading.dart';
import '../../../../common/widgets/ui.dart';
import '../controllers/activity_details_controller.dart';
import '../widgets/activity_attachment_list.dart';
import '../widgets/activity_general_details.dart';
import '../widgets/activity_messages_list.dart';
import '../widgets/activity_remarks.dart';

class ActivityDetailsView extends GetView<ActivityDetailsController> {
  const ActivityDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.connectionController.isConnected.isTrue
        ? WillPopScope(
            onWillPop: () async {
              if (controller.uploadedFiles.isNotEmpty) {
                Ui.confirmDialog(
                    title: Strings.confirm,
                    middleText: Strings.saveActivityData,
                    confirmBtnTitle: Strings.save,
                    onSave: () {
                      Get.back();
                      controller.saveActivity();
                    },
                    onDiscard: () {
                      Get.until((route) => route.isFirst);
                    });
              }
              return true;
            },
            child: RefreshIndicator(
                color: ColorManager.mainColor,
                onRefresh: () async {
                  controller.onInit();
                },
                child: Scaffold(
                  appBar: customDetailsAppBar(title: Strings.activity),
                  floatingActionButton: FloatingActionButton(
                      onPressed: () {
                        controller.saveActivity();
                      },
                      heroTag: null,
                      backgroundColor: ColorManager.mainColor,
                      child: SvgPicture.asset(ImagePaths.save,
                          height: 20.h, width: 20.w)),
                  body: Stack(children: [
                    Padding(
                        padding: EdgeInsets.only(right: 10.w, left: 10.w),
                        child: SingleChildScrollView(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              SizedBox(height: 20.h),
                              Padding(
                                  padding: EdgeInsets.all(10.h),
                                  child: Row(children: [
                                    SvgPicture.asset(ImagePaths.drill,
                                        height: 24.h, width: 26.w),
                                    SizedBox(width: 10.w),
                                    Expanded(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                          Text(Strings.activityTitle,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10.sp,
                                                  color:
                                                      ColorManager.mainColor)),
                                          SizedBox(height: 5.h),
                                          Text(
                                              controller.fitOutStep
                                                  .fitOutStepTask!.first.subject
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: ColorManager.black),
                                              overflow: TextOverflow.ellipsis)
                                        ]))
                                  ])),
                              SizedBox(height: 20.h),
                              const ActivityGeneralDetailsWidget(),
                              SizedBox(height: 20.h),
                              const ActivityRemarks(),
                              SizedBox(height: 20.h),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.h),
                                  child: Text(Strings.messages,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400))),
                              SizedBox(height: 10.h),
                              SizedBox(
                                  height: 185.h,
                                  child: const ActivityMessagesList()),
                              SizedBox(height: 20.h),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const AttachmentTitlePublicWidget(),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.h),
                                        child: SizedBox(
                                            height: 32.h,
                                            width: 32.w,
                                            child: FloatingActionButton(
                                                onPressed: () {
                                                  controller.selectFiles();
                                                },
                                                heroTag: null,
                                                backgroundColor:
                                                    ColorManager.mainColor,
                                                child: Icon(Icons.add,
                                                    color: ColorManager.white,
                                                    size: 20.sp))))
                                  ]),
                              SizedBox(height: 10.h),
                              const ActivityAttachmentsList(),
                              SizedBox(height: 100.h)
                            ]))),
                    Obx(() => Visibility(
                        visible: controller.submitLoading.isTrue ||
                                controller.deletingLoading.isTrue
                            ? true
                            : false,
                        child: const Opacity(
                            opacity: 0.8,
                            child: ModalBarrier(
                                dismissible: false, color: Colors.black)))),
                    Obx(() => Visibility(
                        visible: controller.submitLoading.isTrue ||
                                controller.deletingLoading.isTrue
                            ? true
                            : false,
                        child: const Center(child: SecondCustomLoading())))
                  ]),
                )))
        : const NoInternetConnectionView());
  }
}

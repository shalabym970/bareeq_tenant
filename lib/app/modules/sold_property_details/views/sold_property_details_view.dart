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
import '../controllers/sold_property_details_controller.dart';
import '../widgets/sold_property_attachment.dart';
import '../widgets/sold_property_dates_widget.dart';
import '../widgets/sold_property_general_details.dart';
import '../widgets/sold_property_messages_list.dart';
import '../widgets/sold_property_unit_details.dart';

class SoldPropertyDetailsView extends GetView<SoldPropertyDetailsController> {
  const SoldPropertyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.connectionController.isConnected.isTrue
        ? RefreshIndicator(
        color: ColorManager.mainColor,
        onRefresh: () async {
          controller.onInit();
        },
        child: Scaffold(
          appBar: customDetailsAppBar(
              title:
                  "${Strings.property} (${controller.soldProperty.name ?? Strings.na})"),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                controller.saveProperty();
              },
              heroTag: null,
              backgroundColor: ColorManager.mainColor,
              child:
                  SvgPicture.asset(ImagePaths.save, height: 20.h, width: 20.w)),
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
                            SvgPicture.asset(ImagePaths.group77,
                                height: 24.h, width: 26.w),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Text(Strings.propertyTitle,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.sp,
                                          color: ColorManager.mainColor)),
                                  SizedBox(height: 5.h),
                                  Text(
                                      controller.soldProperty.name ??
                                          Strings.na,
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          color: ColorManager.black))
                                ]))
                          ])),
                      SizedBox(height: 20.h),
                      const SoldPropertyGeneralDetailsWidget(),
                      SizedBox(height: 20.h),
                      const LeasedPropertyUnitDetailsWidget(),
                      SizedBox(height: 20.h),
                      const SoldPropertyDatesWidget(),
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
                      SizedBox(
                          height: 185.h,
                          child: const SoldPropertyMessagesList()),
                      SizedBox(height: 20.h),
                      const AttachmentTitlePublicWidget(),
                      SizedBox(height: 10.h),
                      const SoldPropertyAttachment(),
                      SizedBox(height: 100.h),
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
        )) : const NoInternetConnectionView());
  }
}

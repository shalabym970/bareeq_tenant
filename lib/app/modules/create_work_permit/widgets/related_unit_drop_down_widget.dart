import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_dropdown.dart';
import '../../../../common/widgets/dashboard_shimmer.dart';
import '../../../../common/widgets/error_widget.dart';
import '../controllers/create_work_permit_controller.dart';

class RelatedUnitDropDownWidget extends GetView<CreateWorkPermitController> {
  const RelatedUnitDropDownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
    controller.loadingRelatedUnits.isTrue
        ? Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(Strings.relatedUnit,
            style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: ColorManager.mainColor)),
        ShimmerWidget.rectangular(height: 50.h)
      ]),
    )
        : controller.errorRelatedUnits.isTrue
        ? CustomErrorWidget(
      iconWidth: 20.w,
      iconHeight: 20.h,
      fontSize: 15.sp,
    )
        : GetBuilder<CreateWorkPermitController>(
        builder: (controller) =>
            CustomDropDown(
                value: controller.relatedUnitValue.value?.name == null
                    ? null
                    : controller.relatedUnitValue.value,
                onChange: (newValue) async {
                  controller.relatedUnitValue.value = newValue;
                  Get.log('========== related Unit name : ${controller
                      .relatedUnitValue.value?.name.toString()} ========');
                  controller.update();
                },
                items: controller.relatedUnitsList.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e.name.toString()),
                  );
                }).toList(),
                label: Strings.relatedUnit,
                hint: Strings.selectUnit)));
  }
}

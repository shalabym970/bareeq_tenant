import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings/strings.dart';
import '../controllers/properties_controller.dart';

class PropertiesSwitcherBTN extends GetView<PropertiesController> {
  const PropertiesSwitcherBTN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        height: 40.h,
        width: Get.width,
        decoration: BoxDecoration(color: ColorManager.mainColor),
        child: Row(children: [
          Expanded(
              flex: 1,
              child: GestureDetector(
                  onTap: () {
                    if (controller.selectLeasedProperties.isFalse) {
                      controller.selectLeasedProperties.value = true;
                      controller.getLeasedProperties();
                    }
                  },
                  child: Container(
                      color: controller.selectLeasedProperties.isTrue
                          ? ColorManager.white
                          : ColorManager.mainColor,
                      height: 35.h,
                      child: Center(
                          child: Text(Strings.leasedPropeties,
                              style: TextStyle(
                                  color: controller
                                          .selectLeasedProperties.isTrue
                                      ? ColorManager.mainColor
                                      : ColorManager.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600)))))),
          Expanded(
              flex: 1,
              child: GestureDetector(
                  onTap: () {
                    if (controller.selectLeasedProperties.isTrue) {
                      controller.selectLeasedProperties.value = false;
                      controller.getLeasedProperties();
                    }
                  },
                  child: Container(
                      color: controller.selectLeasedProperties.isTrue
                          ? ColorManager.mainColor
                          : ColorManager.white,
                      height: 35.h,
                      child: Center(
                          child: Text(Strings.soldPropeties,
                              style: TextStyle(
                                  color: controller
                                          .selectLeasedProperties.isTrue
                                      ? ColorManager.white
                                      : ColorManager.mainColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600))))))
        ])));
  }
}

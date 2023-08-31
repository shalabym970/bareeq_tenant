import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_dropdown.dart';
import '../../../../common/widgets/dashboard_shimmer.dart';
import '../../../../common/widgets/error_widget.dart';
import '../controllers/create_work_permit_item_controller.dart';

class SelectItemTypesWidget extends GetView<CreateWorkPermitItemController> {
  const SelectItemTypesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loadingTypes.isTrue
        ? Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(Strings.itemType,
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.mainColor)),
              ShimmerWidget.rectangular(height: 50.h)
            ]),
          )
        : controller.errorTypes.isTrue
            ? CustomErrorWidget(
                iconWidth: 20.w,
                iconHeight: 20.h,
                fontSize: 15.sp,
              )
            : GetBuilder<CreateWorkPermitItemController>(
                builder: (controller) =>   CustomDropDown(
                    value: controller.itemTypeValue,
                    onChange: (newValue) async {},
                    items: controller.itemTypeList.map((items) {
                      return DropdownMenuItem<String>(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    label: Strings.itemType,
                    hint: ''),
    )
    );
  }
}

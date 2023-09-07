import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../common/color_manager.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_dropdown.dart';
import '../../../../common/widgets/dashboard_shimmer.dart';
import '../../../../common/widgets/error_widget.dart';
import '../../../models/account_model.dart';
import '../controllers/create_work_permit_controller.dart';

class ContractorDropDownWidget extends GetView<CreateWorkPermitController> {
  const ContractorDropDownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loadingContractors.isTrue
        ? Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(Strings.contractor,
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.mainColor)),
              ShimmerWidget.rectangular(height: 50.h)
            ]),
          )
        : controller.errorContractors.isTrue
            ? CustomErrorWidget(
                iconWidth: 20.w,
                iconHeight: 20.h,
                fontSize: 15.sp,
              )
            : GetBuilder<CreateWorkPermitController>(
                builder: (controller) => CustomDropDown(
                    value: controller.contractorValue.value?.name == null
                        ? null
                        : controller.contractorValue.value,
                    onChange: (newValue) async {
                      controller.contractorValue.value = newValue;
                      controller.update();
                    },
                    items: controller.contractorsList.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e.name.toString()),
                      );
                    }).toList(),
                    label: Strings.contractor,
                    hint: Strings.contractor)));
  }
}

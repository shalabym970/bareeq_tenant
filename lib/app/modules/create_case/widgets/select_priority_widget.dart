import 'package:Bareeq/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_dropdown.dart';
import '../controllers/add_case_controller.dart';

class SelectPriorityWidget extends GetView<AddCaseController> {
  const SelectPriorityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomDropDown(
        value: controller.selectedPriority.value,
        onChange: (newValue) async {
          controller.selectedPriority.value = newValue;
        },
        items: Constants.casePriorityMap.keys
            .map<DropdownMenuItem<String>>(
              (String key) => DropdownMenuItem<String>(
                value: key,
                child: Text(key),
              ),
            )
            .toList(),
        label: Strings.priority,
        hint: Strings.selectPriority));
  }
}

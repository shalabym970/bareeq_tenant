import 'package:bareeq/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_dropdown.dart';
import '../controllers/add_case_controller.dart';

class SelectCaseTypesWidget extends GetView<AddCaseController> {
  const SelectCaseTypesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomDropDown(
        value: controller.selectedType.value,
        onChange: (newValue) async {
          controller.selectedType.value = newValue;
        },
        items: Constants.caseTypesMap.keys
            .map<DropdownMenuItem<String>>(
              (String key) => DropdownMenuItem<String>(
                value: key,
                child: Text(key),
              ),
            )
            .toList(),
        label: Strings.caseType,
        hint: Strings.selectCase));
  }
}

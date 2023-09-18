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
        items: getDropdownItems(),
        label: Strings.caseType,
        hint: Strings.selectCase));
  }

  List<DropdownMenuItem<String>> getDropdownItems() {
    final handOverDate = controller.relatedUnitValue.value?.handOverDate != null
        ? DateTime.parse(controller.relatedUnitValue.value!.handOverDate!)
        : DateTime(0000, 00, 00);

    final daysPassed = DateTime.now().difference(handOverDate).inDays;
    if (daysPassed >= 365) {
      // If handOverDate has passed from 365 days ago, exclude certain keys
      final excludedKeys = ['Warranty']; // Replace with your keys
      final filteredKeys = Constants.caseTypesMap.keys
          .where((key) => !excludedKeys.contains(key))
          .toList();

      return filteredKeys
          .map<DropdownMenuItem<String>>(
            (String key) => DropdownMenuItem<String>(
              value: key,
              child: Text(key),
            ),
          )
          .toList();
    }

    // Default case or if handOverDate hasn't passed from 365 days ago
    return Constants.caseTypesMap.keys
        .map<DropdownMenuItem<String>>(
          (String key) => DropdownMenuItem<String>(
            value: key,
            child: Text(key),
          ),
        )
        .toList();
  }
}

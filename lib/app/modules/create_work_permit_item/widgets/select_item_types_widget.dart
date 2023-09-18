import 'package:bareeq/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_dropdown.dart';
import '../controllers/create_work_permit_item_controller.dart';

class SelectItemTypesWidget extends GetView<CreateWorkPermitItemController> {
  const SelectItemTypesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomDropDown(
        value: controller.selectedType.value,
        onChange: (newValue) async {
          controller.selectedType.value = newValue;
        },
        items: Constants.workPermitItemTypesMap.keys
            .map<DropdownMenuItem<String>>(
              (String key) => DropdownMenuItem<String>(
                value: key,
                child: Text(key),
              ),
            )
            .toList(),
        label: Strings.itemType,
        hint: Strings.selectItemType));
  }
}

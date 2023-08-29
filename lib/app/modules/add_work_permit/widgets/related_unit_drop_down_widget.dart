import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_dropdown.dart';
import '../controllers/add_work_permit_controller.dart';

class RelatedUnitDropDownWidget extends GetView<AddWorkPermitController> {
  const RelatedUnitDropDownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDropDown(
        value: controller.relatedUnitValue,
        onChange: (String? newValue) async {},
        items: controller.relatedUnitList.map((items) {
          return DropdownMenuItem<String>(
            value: items,
            child: Text(items),
          );
        }).toList(),
        label: Strings.relatedUnit);
  }
}

import 'package:Bareeq/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_dropdown.dart';
import '../controllers/add_case_controller.dart';

class SelectNatureOfComplaintWidget extends GetView<AddCaseController> {
  const SelectNatureOfComplaintWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomDropDown(
        value: controller.selectedNatureOfComplaint.value,
        onChange: (newValue) async {
          controller.selectedNatureOfComplaint.value = newValue;
        },
        items: Constants.natureOfComplaints.keys
            .map<DropdownMenuItem<String>>(
              (String key) => DropdownMenuItem<String>(
                value: key,
                child: Text(key),
              ),
            )
            .toList(),
        label: Strings.natureOfComplaint,
        hint: Strings.selectNatureOfComplaint));
  }
}

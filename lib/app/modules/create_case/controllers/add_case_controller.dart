import 'package:Bareeq/app/models/case_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/strings/error_strings.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/ui.dart';

class AddCaseController extends GetxController {
  final caseTitleController = TextEditingController();
  final requestDetailsController = TextEditingController();
  final addCaseKey = GlobalKey<FormState>();
  final submitLoading = false.obs;
  final _case = Case().obs;
  final caseTypeValue = 'Problem';
  final caseTypeList = <String>['Problem', 'Test', 'Test', 'Test'];
  final natureOfCaseValue = 'Contractual - Price';
  final natureOfCaseList = <String>[
    'Contractual - Price',
    'Test',
    'Test',
    'Test'
  ];
  final relatedUnitValue = 'Unit 10 - Building 8';
  final relatedUnitList = <String>[
    'Unit 10 - Building 8',
    'Test',
    'Test',
    'Test'
  ];
  final relatedLeaseValue = 'Unit 10 - Building 8';
  final relatedLeaseList = <String>[
    'Unit 10 - Building 8',
    'Test',
    'Test',
    'Test'
  ];

  //Todo : you most be implement submit case method
  submitCase() async {
    try {
      if (addCaseKey.currentState!.validate()) {
        addCaseKey.currentState?.save();
        submitLoading.value = true;
        _case.value = Case();
        Ui.showToast(content: Strings.caseAddedSuccessfully);
        Get.back();
      } else {
        Ui.showToast(content: ErrorStrings.pleaseFillFields, error: true);
      }
    } catch (e) {
      submitLoading.value = false;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.failedAddWorkCase));
      Get.log('========== Error when create case : $e ==========');
    } finally {
      submitLoading.value = false;
    }
  }
}

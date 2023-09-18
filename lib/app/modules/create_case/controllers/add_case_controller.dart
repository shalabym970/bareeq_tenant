import 'package:bareeq/app/models/case_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/constants.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/unit.dart';
import '../../../repositories/cases_repo.dart';
import '../../../repositories/work_permit_repo.dart';
import '../../dashboard/controllers/dashboard_controller.dart';

class AddCaseController extends GetxController {
  final caseTitleController = TextEditingController();
  final caseDescriptionController = TextEditingController();
  final addCaseKey = GlobalKey<FormState>();
  final submitLoading = false.obs;
  final _case = Case().obs;
  final errorRelatedUnits = false.obs;
  final loadingRelatedUnits = false.obs;
  final relatedUnitsList = <Unit>[].obs;
  final relatedUnitValue = Rxn<Unit>();
  final selectedType = Rxn<String>();
  final selectedNatureOfComplaint = Rxn<String>();
  final selectedPriority = Rxn<String>();
  final workPermitRepo = WorkPermitRepo();
  final casesRepo = CasesRepo();

  @override
  onInit() async {
    relatedUnitValue.value = null;
    getRelatedUnits();
    super.onInit();
  }

  void getRelatedUnits() async {
    try {
      errorRelatedUnits.value = false;
      loadingRelatedUnits.value = true;
      relatedUnitsList.assignAll(await workPermitRepo.getRelatedUnites());
    } catch (e) {
      errorRelatedUnits.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get related Unites : $e ==========');
    } finally {
      loadingRelatedUnits.value = false;
    }
  }

  submitCase() async {
    try {
      if (addCaseKey.currentState!.validate()) {
        if (selectedType.value != null) {
          if (selectedNatureOfComplaint.value != null) {
            if (relatedUnitValue.value != null) {
              if (selectedPriority.value != null) {
                addCaseKey.currentState?.save();
                submitLoading.value = true;
                _case.value = Case(
                    title: caseTitleController.text,
                    description: caseDescriptionController.text,
                    type: Constants.caseTypesMap[selectedType.value],
                    priority: Constants.casePriorityMap[selectedPriority.value],
                    natureOfComplaint: Constants
                        .natureOfComplaints[selectedNatureOfComplaint.value],
                    unit: relatedUnitValue.value);
                await casesRepo.postCase(request: _case.value);
                Ui.showToast(content: Strings.caseAddedSuccessfully);
                Get.back(result: Get.find<DashboardController>().getCases());
              } else {
                Ui.showToast(content: Strings.selectPriority, error: true);
              }
            } else {
              Ui.showToast(
                  content: ErrorStrings.pleaseSelectRelatedUnit, error: true);
            }
          } else {
            Ui.showToast(content: Strings.selectNatureOfComplaint, error: true);
          }
        } else {
          Ui.showToast(content: ErrorStrings.pleaseSelectCaseType, error: true);
        }
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

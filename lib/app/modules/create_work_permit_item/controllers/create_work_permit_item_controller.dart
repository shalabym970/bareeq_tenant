import 'package:Bareeq/app/models/work_permit.dart';
import 'package:Bareeq/common/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../common/strings/error_strings.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/work_permit_item.dart';
import '../../../repositories/work_permit_repo.dart';
import '../../work_permit_details/controllers/work_permit_details_controller.dart';

class CreateWorkPermitItemController extends GetxController {
  final workItemKey = GlobalKey<FormState>();
  final descriptionController = TextEditingController();
  final submitLoading = false.obs;
  final workPermitItem = WorkPermitItem().obs;
  final loadingTypes = false.obs;
  final errorTypes = false.obs;
  final selectedType = Rxn<String>();
  WorkPermit workPermit = Get.arguments;
  WorkPermitRepo workPermitRepo = WorkPermitRepo();

  submitWorkPermitItem() async {
    try {
      if (workItemKey.currentState!.validate()) {
        if (selectedType.value != null) {
          submitLoading.value = true;
          workItemKey.currentState?.save();
          workPermitItem.value = WorkPermitItem(
              workPermitId: workPermit.id,
              type: Constants.workPermitItemTypesMap[selectedType.value],
              description: descriptionController.text);
          await workPermitRepo.postWorkPermitItem(
              request: workPermitItem.value);
          Ui.showToast(content: Strings.workPermitItemAddedSuccessfully);
          Get.back(
              result:
                  Get.find<WorkPermitDetailsController>().getWorkPermitItems());
        } else {
          Ui.showToast(content: ErrorStrings.pleaseSelectItemType, error: true);
        }
      } else {
        Ui.showToast(content: ErrorStrings.pleaseFillFields, error: true);
      }
    } catch (e) {
      submitLoading.value = false;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.failedAddWorkPermit));
      Get.log('========== Error when create work permit Item : $e ==========');
    } finally {
      submitLoading.value = false;
    }
  }
}

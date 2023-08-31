import 'package:Bareeq/app/models/work_permit.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/work_permit_item.dart';
import '../../../repositories/work_permit_repo.dart';

class CreateWorkPermitItemController extends GetxController {
  final workItemKey = GlobalKey<FormState>();
  final descriptionController = TextEditingController();
  final submitLoading = false.obs;
  final itemTypeValue = 'WP--02--23';
  final itemTypeList = <String>['WP--02--23', 'fj', 'hgh', 'hghg'];
  final workPermitItem = WorkPermitItem().obs;
  final loadingTypes = false.obs;
  final errorTypes = false.obs;
  WorkPermit workPermit = Get.arguments;
  WorkPermitRepo workPermitRepo = WorkPermitRepo();

  submitWorkPermitItem() async {
    try {
      if (workItemKey.currentState!.validate()) {
        if (itemTypeValue == 'WP--02--23') {
          submitLoading.value = true;
          workItemKey.currentState?.save();
          workPermitItem.value = WorkPermitItem(
              workPermitId: workPermit.id,
              //Todo : you will be change this type value when get it from database
              type: 111,
              description: descriptionController.text);
          await workPermitRepo.postWorkPermitItem(
              request: workPermitItem.value);
          Ui.showToast(content: Strings.workPermitItemAddedSuccessfuly);
          Get.back();
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

import 'package:bareeq/app/repositories/profile_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../helper/cash_helper.dart';
import '../../../models/contact_model.dart';
import '../../../services/session_services.dart';

class ChangePasswordController extends GetxController {
  final changePassLoading = false.obs;
  final profile = ProfileRepo();
  final changePasswordKey = GlobalKey<FormState>();
  final _contact = Contact().obs;
  final profileRepo = ProfileRepo();
  final currentPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();
  final currentPasswordVisible = true.obs;
  final newPasswordVisible = true.obs;


  changePassword() async {
    try {
      if (changePasswordKey.currentState!.validate()) {
        changePasswordKey.currentState?.save();
        changePassLoading.value = true;
        _contact.value = Contact(password: confirmPassController.text);
        await profileRepo.updateProfile(request: _contact.value).then((value) {
          Get.find<SessionServices>().currentUser.value.password =
              confirmPassController.text;
        }).then((value) => updateSharedUserData());
        Ui.showToast(content: Strings.passwordChangedSuccessfully);
        Get.back();
      }
    } catch (e) {
      changePassLoading.value = false;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.failedToChangePass));
    } finally {
      changePassLoading.value = false;
    }
  }

  updateSharedUserData() {
    CashHelper.saveData(key:'user_password', value :confirmPassController.text.toString());
  }
}

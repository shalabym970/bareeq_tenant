import 'package:Bareeq/app/repositories/profile_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/contact_model.dart';
import '../../../services/session_services.dart';

class ChangePasswordController extends GetxController {
  final changePassLoading = false.obs;
  final profile = ProfileRepo();
  final changePasswordKey = GlobalKey<FormState>();
  final _contact = const Contact().obs;
  final profileRepo = ProfileRepo();

  TextEditingController currentPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  changePassword() async {
    try {
      if (changePasswordKey.currentState!.validate()) {
        changePasswordKey.currentState?.save();
        changePassLoading.value = true;
        _contact.value = Contact(
            id: Get.find<SessionServices>().currentUser.value.id,
            password: newPassController.text);
        await profileRepo.updateProfile(request: _contact.value);
        Ui.showToast(content: Strings.passwordChangedSuccessfuly);
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
}

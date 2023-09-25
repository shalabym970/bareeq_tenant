import 'dart:math';
import 'package:bareeq/app/routes/app_routes.dart';
import 'package:bareeq/app/services/general_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/contact_model.dart';
import '../../../repositories/login_repo.dart';
import '../../../repositories/profile_repo.dart';
import '../../../services/check_internet_connection_service.dart';

class AccountRecoverController extends GetxController {
  final recoverFormKey = GlobalKey<FormState>();
  final _contacts = <Contact>[];
  final _contact = Contact().obs;
  final loadingRecoverAccount = false.obs;
  final loginRepository = LoginRepository();
  final profileRepo = ProfileRepo();
  bool foundEmail = false;
  final connectionController = Get.find<InternetConnectionController>();
  final recoverEmailController = TextEditingController();

  recoverAccount() async {
    try {
      if (recoverFormKey.currentState!.validate()) {
        recoverFormKey.currentState?.save();
        loadingRecoverAccount.value = true;
        _contacts.assignAll(await loginRepository.getAllContacts());
        int? randomNumber;
        for (Contact contact in _contacts) {
          if (contact.emailAddress == recoverEmailController.text) {
            foundEmail = true;
            randomNumber =  GeneralServices.generateOtp();
            _contact.value = Contact(
                otp: randomNumber.toString(),
                resetPassword: true,
                id: contact.id);
            break;
          }
        }
        foundEmail
            ? await profileRepo.updateProfile(request: _contact.value).then(
                (value) => Get.toNamed(Routes.otp, arguments: _contact.value)!
                    .then((value) => loadingRecoverAccount.value = false)
                    .then((value) => foundEmail = false))
            : Ui.showToast(
                content: ErrorStrings.nothingMatchingEmail, error: true);
      }
    } catch (e) {
      loadingRecoverAccount.value = false;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.failedToChangePass));
    } finally {
      loadingRecoverAccount.value = false;
    }
  }
}

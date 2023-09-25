import 'dart:math';

import 'package:bareeq/app/helper/cash_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/global_widgets.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/contact_model.dart';
import '../../../repositories/login_repo.dart';
import '../../../repositories/profile_repo.dart';
import '../../../routes/app_routes.dart';
import '../../../services/check_internet_connection_service.dart';

class AuthController extends GetxController {
  final loading = false.obs;
  final currentContact = Contact().obs;
  final loginFormKey = GlobalKey<FormState>();
  final recoverFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final recoverEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordVisible = true.obs;
  final loadingRecoverAccount = false.obs;
  final connectionController = Get.find<InternetConnectionController>();
  final loginRepository = LoginRepository();
  final profileRepo = ProfileRepo();
  final _contacts = <Contact>[];
  final _contact = Contact().obs;

  login() async {
    try {
      if (loginFormKey.currentState!.validate()) {
        loading.value = true;
        loginFormKey.currentState?.save();
        currentContact.value = Contact(
          emailAddress: emailController.text,
          password: passwordController.text,
        );
        final isPotentialUser =
            await loginRepository.authorizing(user: currentContact.value);
        if (isPotentialUser == true) {
          Get.log('=================  authorized =================');
          Get.offAllNamed(Routes.dashboard);
        } else {
          GlobalWidgets.getToast(
              msg: ErrorStrings.publicErrorMessage, fontSize: 14.sp);
          Get.log('================= not authorized =================');
        }
      }
    } catch (e) {
      loading.value = false;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.wrongEmailOrPassword));
      CashHelper.clearData();
      Get.log('========== Error when login : $e ==========');
    } finally {
      loading.value = false;
    }
  }

  recoverAccount() async {
    try {
      if (recoverFormKey.currentState!.validate()) {
        recoverFormKey.currentState?.save();
        loadingRecoverAccount.value = true;
        _contacts.assignAll(await loginRepository.getAllContacts());
        for (Contact contact in _contacts) {
          if (contact.emailAddress == recoverEmailController.text) {
            int randomNumber = generateOtp();
            _contact.value = Contact(
                otp: randomNumber.toString(),
                resetPassword: true,
                id: contact.id);
            await profileRepo.updateProfile(request: _contact.value);
            return;
          }
        }
      }
    } catch (e) {
      loadingRecoverAccount.value = false;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.failedToChangePass));
    } finally {
      loadingRecoverAccount.value = false;
    }
  }

  int generateOtp() {
    int min = 100000; // Minimum 6-digit number
    int max = 999999; // Maximum 6-digit number
    Random random = Random();
    int otp = min + random.nextInt(max - min + 1);
    Get.log('================= get log the otp : $otp =================');
    return otp;
  }
}

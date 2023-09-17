import 'package:Bareeq/app/helper/cash_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/global_widgets.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/contact_model.dart';
import '../../../repositories/login_repo.dart';
import '../../../routes/app_routes.dart';

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
  LoginRepository loginRepository = LoginRepository();

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
          GlobalWidgets.getToast(msg: ErrorStrings.authWrong, fontSize: 14.sp);
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
        // _contact.value = Contact(
        //     id: Get.find<SessionServices>().currentUser.value.id,
        //     password: newPassController.text);
        // await profileRepo.updateProfile(request: _contact.value);
        //
        //  Ui.showToast(content: Strings.passwordChangedSuccessfuly);
        Get.back();
      }
    } catch (e) {
      loadingRecoverAccount.value = false;
      //   Get.showSnackbar(
      //       Ui.errorSnackBar(message: ErrorStrings.failedToChangePass));
      // } finally {
      loadingRecoverAccount.value = false;
    }
  }
}

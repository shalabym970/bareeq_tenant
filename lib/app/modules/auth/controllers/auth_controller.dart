import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/global_widgets.dart';
import '../../../models/contact_model.dart';
import '../../../repositories/login_repo.dart';
import '../../../routes/app_routes.dart';

class AuthController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final recoverFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final recoverEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordVisible = true.obs;
  final loading = false.obs;
  final currentContact = const Contact().obs;
  LoginRepository loginRepository = LoginRepository();

  login() async {
    try {
      if (loginFormKey.currentState!.validate()) {
        loading.value = true;
        loginFormKey.currentState?.save();
        final isPotentialUser = await loginRepository.getAllContacts(
            email: emailController.text, password: passwordController.text);
        if (isPotentialUser == true) {
          Get.log('=================  authorized =================');
          Get.offAllNamed(Routes.dashboard);
        } else {
          GlobalWidgets.getToast(msg: ErrorStrings.authWrong, fontSize: 14.sp);
          Get.log('================= not authorized =================');
        }
      }
    } catch (e) {
      Get.log(' ========== error : $e ==========');
    } finally {
      loading.value = false;
    }
  }
}

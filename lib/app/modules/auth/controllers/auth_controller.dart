import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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

  // @override
  // void onInit() async {
  //   Get.put<SettingServices>(SettingServices());
  //   super.onInit();
  // }

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

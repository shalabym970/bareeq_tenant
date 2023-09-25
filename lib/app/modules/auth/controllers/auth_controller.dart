import 'package:bareeq/app/helper/cash_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/global_widgets.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/contact_model.dart';
import '../../../repositories/login_repo.dart';
import '../../../routes/app_routes.dart';
import '../../../services/check_internet_connection_service.dart';

class AuthController extends GetxController {
  final loading = false.obs;
  final currentContact = Contact().obs;
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordVisible = true.obs;
  final connectionController = Get.find<InternetConnectionController>();
  final loginRepository = LoginRepository();


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


}

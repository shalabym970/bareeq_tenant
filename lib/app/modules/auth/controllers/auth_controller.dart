import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final recoverFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final recoverEmailController = TextEditingController();
  final passwordController = TextEditingController();
}

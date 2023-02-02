import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProfileController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final jobTitleController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();
  final accountNameController = TextEditingController();
  final crNumberController = TextEditingController();
  final cprNumberController = TextEditingController();

  /// Change password page controllers
  final currentPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();
}

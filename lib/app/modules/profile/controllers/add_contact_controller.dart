import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AddContactController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final jobTitleController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();
  final businessPhoneController = TextEditingController();
}

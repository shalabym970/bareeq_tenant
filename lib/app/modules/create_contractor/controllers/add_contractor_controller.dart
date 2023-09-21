import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/check_internet_connection_service.dart';

class AddContractorController extends GetxController {
  final companyNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addWorkPermitKey = GlobalKey<FormState>();
  final connectionController = Get.find<InternetConnectionController>();

  submitNewContractor() {
    if (addWorkPermitKey.currentState!.validate()) {
      addWorkPermitKey.currentState?.save();
    }
  }
}

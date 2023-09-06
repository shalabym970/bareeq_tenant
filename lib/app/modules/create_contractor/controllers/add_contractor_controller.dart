import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddContractorController extends GetxController {
  final companyNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addWorkPermitKey = GlobalKey<FormState>();

  submitNewContractor() {
    if (addWorkPermitKey.currentState!.validate()) {
      addWorkPermitKey.currentState?.save();
    }
  }
}

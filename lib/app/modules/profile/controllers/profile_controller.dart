import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../models/contact_model.dart';
import '../../../repositories/profile_repo.dart';
import '../../../services/session_services.dart';

class ProfileController extends GetxController {
  final loadingContacts = false.obs;
  final errorContacts = false.obs;
  final contacts = <Contact>[].obs;
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController crNumberController = TextEditingController();
  TextEditingController cprNumberController = TextEditingController();
  ProfileRepo profileRepo = ProfileRepo();

  @override
  void onInit() {
    jobTitleController =
        TextEditingController(text: currentUser.jobTile.toString());
    mobileNumberController =
        TextEditingController(text: currentUser.mobilePhone.toString());
    crNumberController =
        TextEditingController(text: currentUser.crNumber.toString());
    cprNumberController =
        TextEditingController(text: currentUser.cprNumber.toString());
    getContacts();
    super.onInit();
  }

  getContacts() async {
    try {
      errorContacts.value = false;
      loadingContacts.value = true;

      contacts.assignAll(
          await profileRepo.getContacts(accountId: currentUser.account!.id!));
    } catch (e) {
      errorContacts.value = true;
      Get.log(' ========== error : $e ==========');
    } finally {
      loadingContacts.value = false;
    }
  }

  Contact get currentUser {
    return Get.find<SessionServices>().currentUser.value;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../../main.dart';
import '../../../models/contact_model.dart';
import '../../../repositories/profile_repo.dart';
import '../../../routes/app_routes.dart';
import '../../../services/session_services.dart';

class ProfileController extends GetxController {
  final loadingContacts = false.obs;
  final errorContacts = false.obs;
  final contacts = <Contact>[].obs;
  final profileRepo = ProfileRepo();
  final changeProfileKey = GlobalKey<FormState>();
  final changeProfileLoading = false.obs;
  final _contact = Contact().obs;
  bool profileIsChanged = false;
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController crNumberController = TextEditingController();
  TextEditingController cprNumberController = TextEditingController();

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

  Contact get currentUser {
    return Get.find<SessionServices>().currentUser.value;
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

  changeProfile() async {
    if (profileIsChanged) {
      try {
        if (changeProfileKey.currentState!.validate()) {
          changeProfileKey.currentState?.save();
          changeProfileLoading.value = true;
          _contact.value = Contact(
              mobilePhone: mobileNumberController.text,
              jobTile: jobTitleController.text,
              crNumber: int.tryParse(crNumberController.text),
              cprNumber: int.tryParse(cprNumberController.text));
          await profileRepo
              .updateProfile(request: _contact.value)
              .then((value) {
            Get.find<SessionServices>().currentUser.value.jobTile =
                jobTitleController.text;
            Get.find<SessionServices>().currentUser.value.mobilePhone =
                mobileNumberController.text;
            Get.find<SessionServices>().currentUser.value.cprNumber =
                int.tryParse(cprNumberController.text);
            Get.find<SessionServices>().currentUser.value.crNumber =
                int.tryParse(crNumberController.text);
          }).then((value) => updateSharedUserData());

          Ui.showToast(content: Strings.profileChangedSuccessfully);
          Get.offAllNamed(Routes.dashboard);
        }
      } catch (e) {
        changeProfileLoading.value = false;
        Get.showSnackbar(Ui.errorSnackBar(message: ErrorStrings.failedToSave));
        Get.log('========== Error when update profile : $e ==========');
      } finally {
        changeProfileLoading.value = false;
      }
    } else {
      Ui.showToast(content: Strings.dontChangedAnyThing);
    }
  }

  updateSharedUserData() {
    sharedPref!.setString('user_job_title', jobTitleController.text);
    sharedPref!.setString('user_mobilePhone', mobileNumberController.text);
    sharedPref!.setString('user_crNumber', crNumberController.text.toString());
    sharedPref!
        .setString('user_cprNumber', cprNumberController.text.toString());
  }

  @override
  onClose() {
    Get.log('========== WorkPermitDetailsController is closed =========');
    Get.delete<ProfileController>();
  }
}

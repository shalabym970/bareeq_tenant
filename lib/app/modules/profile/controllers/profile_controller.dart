import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../helper/cash_helper.dart';
import '../../../models/contact_model.dart';
import '../../../repositories/profile_repo.dart';
import '../../../routes/app_routes.dart';
import '../../../services/check_internet_connection_service.dart';
import '../../../services/session_services.dart';

class ProfileController extends GetxController {
  final loadingContacts = false.obs;
  final errorContacts = false.obs;
  final contacts = <Contact>[].obs;
  final profileRepo = ProfileRepo();
  final changeProfileKey = GlobalKey<FormState>();
  final changeProfileLoading = false.obs;
  final _contact = Contact().obs;
  final connectionController = Get.find<InternetConnectionController>();

  bool profileIsChanged = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController crNumberController = TextEditingController();
  TextEditingController cprNumberController = TextEditingController();

  @override
  void onInit() async {
    jobTitleController =
        TextEditingController(text: currentUser.jobTile ?? Strings.na);
    mobileNumberController =
        TextEditingController(text: currentUser.mobilePhone ?? Strings.na);
    crNumberController =
        TextEditingController(text: currentUser.crNumber ?? Strings.na);
    cprNumberController =
        TextEditingController(text: currentUser.cprNumber ?? Strings.na);
    firstNameController =
        TextEditingController(text: currentUser.firstName ?? Strings.na);
    lastNameController =
        TextEditingController(text: currentUser.lastName ?? Strings.na);
    emailController =
        TextEditingController(text: currentUser.emailAddress ?? Strings.na);
    accountNameController =
        TextEditingController(text: currentUser.account?.name ?? Strings.na);
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      getContacts();
    }
    super.onInit();
  }

  Contact get currentUser {
    return Get.find<SessionServices>().currentUser.value;
  }

  getContacts() async {
    try {
      errorContacts.value = false;
      loadingContacts.value = true;

      contacts.assignAll(await profileRepo.getContacts(
          accountId: Get.find<SessionServices>()
              .currentUser
              .value
              .accountCustomerId!));
    } catch (e) {
      errorContacts.value = true;
      Get.log(' ========== error contacts : $e ==========');
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
              crNumber: crNumberController.text,
              cprNumber: cprNumberController.text);
          await profileRepo
              .updateProfile(request: _contact.value)
              .then((value) {
            Get.find<SessionServices>().currentUser.value.jobTile =
                jobTitleController.text;
            Get.find<SessionServices>().currentUser.value.mobilePhone =
                mobileNumberController.text;
            Get.find<SessionServices>().currentUser.value.cprNumber =
                cprNumberController.text;
            Get.find<SessionServices>().currentUser.value.crNumber =
                crNumberController.text;
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
    CashHelper.saveData(key: 'user_job_title', value: jobTitleController.text);
    CashHelper.saveData(
        key: 'user_mobilePhone', value: mobileNumberController.text);
    CashHelper.saveData(key: 'user_crNumber', value: crNumberController.text);
    CashHelper.saveData(key: 'user_cprNumber', value: cprNumberController.text);
  }

  @override
  onClose() {
    Get.log('========== WorkPermitDetailsController is closed =========');
    Get.delete<ProfileController>();
  }
}

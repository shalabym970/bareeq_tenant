import 'package:Bareeq/app/models/contact_model.dart';
import 'package:Bareeq/app/modules/profile/controllers/profile_controller.dart';
import 'package:Bareeq/app/services/session_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../repositories/profile_repo.dart';

class AddContactController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final jobTitleController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();
  final businessPhoneController = TextEditingController();
  final addNewContactKey = GlobalKey<FormState>();
  final submitLoading = false.obs;
  final _contact = const Contact().obs;
  ProfileRepo profileRepo = ProfileRepo();

  submitNewContact() async {
    try {
      if (addNewContactKey.currentState!.validate()) {
        addNewContactKey.currentState?.save();
        submitLoading.value = true;
        _contact.value = Contact(
          emailAddress: emailController.text,
          accountCustomerId:
              Get.find<SessionServices>().currentUser.value.accountCustomerId,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          mobilePhone: mobileNumberController.text,
          businessPhone: businessPhoneController.text,
          jobTile: jobTitleController.text,
        );
        await profileRepo.postContact(request: _contact.value);
        Ui.showToast(content: Strings.contactAddedSuccessfuly);
        Get.back(result: Get.find<ProfileController>().getContacts());
      } else {
        Ui.showToast(content: ErrorStrings.pleaseFillFields, error: true);
      }
    } catch (e) {
      submitLoading.value = false;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.failedAddWorkPermit));
      Get.log('========== Error when new contact : $e ==========');
    } finally {
      submitLoading.value = false;
    }
  }
}

import 'package:Seef/app/services/setting_services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/contact_model.dart';
import '../providers/api_client_provider.dart';

class LoginRepository {
  Future<bool> getAllContacts(
      {required String email, required String password}) async {
    Contact potentialUser = Contact(emailAddress: email, password: password);
    bool authorizedUser = await checkUser(user: potentialUser);
    return authorizedUser;
  }

  Future<bool> checkUser({required Contact user}) async {
    List<Contact> allContacts = await ApiClientProvider.getAllContacts();
    for (var contact in allContacts) {
      if (contact == user) {
        Get.log('====================  true =======================');
        Get.find<SettingServices>().setSessionData(user:contact);
        return true;
      }
    }
    return false;
  }
}

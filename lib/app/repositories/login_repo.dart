import 'package:get/get.dart';
import '../models/contact_model.dart';
import '../models/login_activity_model.dart';
import '../providers/api_client/contact_api.dart';
import '../services/session_services.dart';

class LoginRepository {

  Future<LoginActivityModel> addLoginActivity() {
    return ContactApi.addLoginActivity();
  }

  final contacts = <Contact>[].obs;
  Future<List<Contact>> getAllContacts() async {
    return await ContactApi.getAllContacts();
  }

  Future<bool> authorizing({required Contact user}) async {
    contacts.assignAll(await getAllContacts());
    for (var contact in contacts) {
      if (contact == user) {
        await Get.find<SessionServices>().setSessionData(user: contact);
        await Get.find<SessionServices>().getSessionUser();
        return true;
      }
    }
    return false;
  }
}

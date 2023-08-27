import '../models/contact_model.dart';
import '../providers/api_client/contact_api.dart';

class ProfileRepo {
  ContactApi contactApi = ContactApi();

  Future<List<Contact>> getContacts({required String accountId}) async {
    return ContactApi.getAllContacts(accountId: accountId);
  }
}

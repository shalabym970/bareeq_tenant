import 'package:bareeq/app/providers/api_client/contact_api.dart';

import '../models/contact_model.dart';

class ProfileRepo {
  Future postContact({required Contact request}) async {
    return await ContactApi.postContact(request: request);
  }

  Future updateProfile({required Contact request}) async {
    return await ContactApi.updateProfile(request: request);
  }

  Future<List<Contact>> getContacts({required String accountId}) async {
    return ContactApi.getAllContacts(accountId: accountId);
  }
}

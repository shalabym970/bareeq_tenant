import 'dart:convert';
import 'package:get/get.dart';
import '../../../common/constants.dart';
import '../../../main.dart';
import '../../models/contact_model.dart';
import '../../services/nltm_auhtorization_service.dart';

class ContactApi extends GetxService {
  /// get Contacts
  static Future<List<Contact>> getAllContacts({String? accountId}) async {
    String url = accountId == null
        ? '${Constants.baseUrl}contacts?\$select=emailaddress1,fullname,jobtitle,customersizecode,createdon,'
            'callback,_parentcustomerid_value,_transactioncurrencyid_value,contactid,bls_cprnumber,mobilephone,'
            'blser_password,telephone1,bls_crnumber,company,blser_country,department,lastname,firstname'
            '&\$expand=parentcustomerid_account(\$select=name,_transactioncurrencyid_value,accountid,'
            '_primarycontactid_value,bls_accountstatus,_ownerid_value,accountnumber,emailaddress1,'
            'new_registrationnumbercr,blser_accounttype,new_cbrnumber)'
        : '${Constants.baseUrl}contacts?\$select=emailaddress1,fullname,jobtitle,customersizecode,createdon,'
            'callback,_parentcustomerid_value,_transactioncurrencyid_value,contactid,bls_cprnumber,mobilephone,'
            'blser_password,telephone1,bls_crnumber,company,blser_country,department,lastname,firstname'
            '&\$expand=parentcustomerid_account(\$select=name,_transactioncurrencyid_value,accountid,'
            '_primarycontactid_value,bls_accountstatus,_ownerid_value,accountnumber,emailaddress1,'
            'new_registrationnumbercr,blser_accounttype,new_cbrnumber)'
            '&\$filter=(parentcustomerid_account/accountid eq $accountId)';
    var response = await NLTMAuthServices.client.get(Uri.parse(url));
    Get.log('=============== All Contacts url :  $url ==========');

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      var decodeResponse =
          await NLTMAuthServices.decodeResponse(response: response);
      Get.log(
          '=============== All Contacts response :   ${response.body} ==========');
      return decodeResponse['value']
          .map<Contact>((obj) => Contact.fromJson(obj))
          .toList();
    } else {
      Get.log(
          '=============== error when get contacts :   ${response.reasonPhrase.toString()} ==========');
      throw Exception(response.reasonPhrase.toString());
    }
  }

  /// Post Contact
  static Future postContact({required Contact request}) async {
    String url = "${Constants.baseUrl}contacts";
    Get.log("========== post contact url : $url ==========");

    var response = await NLTMAuthServices.client
        .post(Uri.parse(url),
            headers: Constants.headers,
            body: jsonEncode(request.toJson()),
            encoding: encoding)
        .catchError((error) {
      Get.log(error.toString());
    }).timeout(const Duration(seconds: 30));
    var decodeResponse =
        await NLTMAuthServices.decodeResponse(response: response);
    Get.log('========== post contact response : $decodeResponse ==========');
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
    } else {
      throw Exception();
    }
  }

  /// update user profile
  static Future updateProfile({required Contact request}) async {
    String url = "${Constants.baseUrl}contacts";
    Get.log("========== update contact url : $url ==========");

    var response = await NLTMAuthServices.client
        .patch(Uri.parse(url),
            headers: Constants.headers,
            body: jsonEncode(request.toJson()),
            encoding: encoding)
        .catchError((error) {
      Get.log(error.toString());
    }).timeout(const Duration(seconds: 30));
    var decodeResponse =
        await NLTMAuthServices.decodeResponse(response: response);
    Get.log('========== update contact response : $decodeResponse ==========');
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
    } else {
      throw Exception();
    }
  }
}

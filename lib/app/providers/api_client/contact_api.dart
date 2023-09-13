import 'package:Bareeq/app/services/session_services.dart';
import 'package:get/get.dart';
import '../../models/contact_model.dart';
import '../../models/login_activity_model.dart';
import '../../services/api_services.dart';
import '../../services/token_services.dart';

class ContactApi extends GetxService {
  /// get Contacts
  static Future<List<Contact>> getAllContacts({String? accountId}) async {
    String url = accountId == null
        ? 'contacts?\$select=emailaddress1,fullname,jobtitle,customersizecode,createdon,'
            'callback,_parentcustomerid_value,_transactioncurrencyid_value,contactid,bls_cprnumber,mobilephone,'
            'blser_password,telephone1,bls_crnumber,company,blser_country,department,lastname,firstname'
            '&\$expand=parentcustomerid_account(\$select=name,_transactioncurrencyid_value,accountid,'
            '_primarycontactid_value,bls_accountstatus,_ownerid_value,accountnumber,emailaddress1,'
            'new_registrationnumbercr,blser_accounttype,new_cbrnumber)'
        : 'contacts?\$select=emailaddress1,fullname,jobtitle,customersizecode,createdon,'
            'callback,_parentcustomerid_value,_transactioncurrencyid_value,contactid,bls_cprnumber,mobilephone,'
            'blser_password,telephone1,bls_crnumber,company,blser_country,department,lastname,firstname'
            '&\$expand=parentcustomerid_account(\$select=name,_transactioncurrencyid_value,accountid,'
            '_primarycontactid_value,bls_accountstatus,_ownerid_value,accountnumber,emailaddress1,'
            'new_registrationnumbercr,blser_accounttype,new_cbrnumber)'
            '&\$filter=(parentcustomerid_account/accountid eq $accountId)';
    Get.log('=============== All Contacts url :  $url ==========');
    var response = await ApiServices.getData(url: url);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      var decodeResponse =
          await TokenServices.decodeResponse(response: response);
      Get.log(
          '========= All Contacts response :   ${response.body} ==========');
      return decodeResponse['value']
          .map<Contact>((obj) => Contact.fromJson(obj))
          .toList();
    } else {
      Get.log(
          '=============== error when get contacts :   ${response.bodyString.toString()} ==========');
      throw Exception(response.bodyString.toString());
    }
  }

  static Future<LoginActivityModel> addLoginActivity() async {
    String url = "inihrm_loginactivities";
    var response = await ApiServices.postData(body: {}, url: url);
    var decodeResponse = await TokenServices.decodeResponse(response: response);
    Get.log('========== login activity response : $decodeResponse ==========');
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      return LoginActivityModel.fromJson(decodeResponse);
    } else {
      throw Exception(decodeResponse['message']);
    }
  }

  /// Post Contact
  static Future postContact({required Contact request}) async {
    String url = "contacts";
    Get.log("========== post contact url : $url ==========");
    var response = await ApiServices.postData(body: request.toJson(), url: url);
    var decodeResponse = await TokenServices.decodeResponse(response: response);
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
    String url =
        "contacts(${Get.find<SessionServices>().currentUser.value.id})";
    Get.log("========== update contact url : $url ==========");
    var response = await ApiServices.postData(body: request.toJson(), url: url);
    var decodeResponse = await TokenServices.decodeResponse(response: response);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      Get.log(
          '========== update contact response : $decodeResponse ==========');
    } else {
      throw Exception();
    }
  }
}

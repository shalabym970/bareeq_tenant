import 'dart:convert';
import 'package:Bareeq/app/services/session_services.dart';
import 'package:get/get.dart';
import '../../helper/cash_helper.dart';
import '../../models/contact_model.dart';
import '../../helper/api_helper.dart';
import '../../helper/token_helper.dart';
import 'package:http/http.dart' as http;

class ContactApi extends GetxService {
  static getToken() async {
    String url =
        "https://login.microsoftonline.com/4c1deabc-9d91-4bdc-ad79-ef0032abd1e2/oauth2/token";
    const String clientId = '1789a239-2a62-402b-9670-4f8722c8f7b5';
    const String resource = "https://bar.crm4.dynamics.com";
    const String clientSecret = 'wEM8Q~VQAaFhIMLl5vx1cg4AHXSr6oJX2HGHcak6';

    Map<String, dynamic> body = {
      'grant_type': "client_credentials",
      'client_id': clientId,
      'client_secret': clientSecret,
      'resource': resource,
    };

    try {
      var response = await http.post(Uri.parse(url), body: body);
      Get.log("access token ${response.statusCode}");
      if (response.statusCode == 200) {
        var decodeResponse =
            await jsonDecode(response.body) as Map<String, dynamic>;
        Get.log('========= token decoded : $decodeResponse ==========');
        CashHelper.saveData(
            key: 'access_token', value: decodeResponse['access_token']);
        Get.log('========== access_token :  ${decodeResponse['access_token']}');
      }
    } catch (e) {
      Get.log(
          '========== erorr when get Access Token : ${e.toString()} ==========');
    }
  }

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
    var response = await ApiHelper.getData(url: url);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      var decodeResponse = await TokenHelper.decodeResponse(response: response);
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
    String url = "contacts";
    Get.log("========== post contact url : $url ==========");
    var response = await ApiHelper.postData(body: request.toJson(), url: url);
    var decodeResponse = await TokenHelper.decodeResponse(response: response);
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
    var response = await ApiHelper.postData(body: request.toJson(), url: url);
    var decodeResponse = await TokenHelper.decodeResponse(response: response);
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

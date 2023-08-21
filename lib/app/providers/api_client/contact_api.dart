import 'package:Bareeq/app/models/invoice.dart';
import 'package:Bareeq/app/services/session_services.dart';
import 'package:get/get.dart';
import '../../../common/constants.dart';
import '../../../common/widgets/ui.dart';
import '../../models/case_model.dart';
import '../../models/contact_model.dart';
import '../../services/nltm_auhtorization_service.dart';

class ContactApi extends GetxService {
  static Future<List<Contact>> getAllContacts() async {
    String url =
        '${Constants.baseUrl}contacts?\$select=emailaddress1,fullname,customersizecode,createdon,callback,_parentcustomerid_value,_transactioncurrencyid_value,contactid,bls_cprnumber,mobilephone,blser_password,telephone1,bls_crnumber,company,blser_country,department,lastname,firstname&\$expand=parentcustomerid_account(\$select=name,_transactioncurrencyid_value,accountid,_primarycontactid_value,bls_accountstatus,_ownerid_value,accountnumber,emailaddress1,new_registrationnumbercr,blser_accounttype,new_cbrnumber)&\$filter=(parentcustomerid_account/accountid%20ne%20null)';
    var response = await NLTMAuthServices.client.get(Uri.parse(url));
    Get.log('=============== All Contacts url :  $url ==========');
    Get.log(
        '=============== All Contacts response :   ${response.body} ==========');
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      var decodeResponse =
      await NLTMAuthServices.decodeResponse(response: response);
      return decodeResponse['value']
          .map<Contact>((obj) => Contact.fromJson(obj))
          .toList();
    } else {
      Get.showSnackbar(Ui.errorSnackBar(message: response.reasonPhrase.toString()));
      throw Exception(response.reasonPhrase.toString());
    }
  }



}

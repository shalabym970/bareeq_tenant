import 'package:Seef/app/models/invoice.dart';
import 'package:Seef/app/services/session_services.dart';
import 'package:get/get.dart';
import '../../common/constants.dart';
import '../../common/widgets/ui.dart';
import '../models/contact_model.dart';
import '../services/nltm_auhtorization_service.dart';

class ApiClientProvider extends GetxService {
  static Future<List<Contact>> getAllContacts() async {
    String url =
        '${Constants.baseUrl}contacts?\$select=emailaddress1,fullname,customersizecode,createdon,callback,_parentcustomerid_value,_transactioncurrencyid_value,contactid,bls_cprnumber,mobilephone,blser_password,telephone1,bls_crnumber,company,blser_country,department,lastname,firstname&\$expand=parentcustomerid_account(\$select=name,_transactioncurrencyid_value,accountid,_primarycontactid_value,bls_accountstatus,_ownerid_value,accountnumber,emailaddress1,new_registrationnumbercr,blser_accounttype,new_cbrnumber)&\$filter=(parentcustomerid_account/accountid%20ne%20null)';
    var response = await NLTMAuthServices.client.get(Uri.parse(url));

    var decodeResponse =
        await NLTMAuthServices.decodeResponse(response: response);
    Get.log('=============== All Contacts url :  $url ==========');
    Get.log(
        '=============== All Contacts response :  $decodeResponse ==========');
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      return decodeResponse['value']
          .map<Contact>((obj) => Contact.fromJson(obj))
          .toList();
    } else {
      Get.showSnackbar(Ui.errorSnackBar(message: decodeResponse['message']));
      throw Exception(decodeResponse['message']);
    }
  }

  static Future<List<Invoice>> getInvoices() async {
    String url =
        '${Constants.baseUrl}invoices?\$select=totalamountlessfreight,_transactioncurrencyid_value,blser_paymenttype,freightamount,new_erpid,emailaddress,name,totalamount,blser_amountpaid,totallineitemamount,invoiceid,invoicenumber,prioritycode,createdon,datedelivered,_ownerid_value,blser_amountdueremaining,_customerid_value,paymenttermscode,statecode,totaldiscountamount,modifiedon,totaltax,statuscode,blser_paymentmethod,blser_erpinvoicetype,description,discountamount,discountpercentage,duedate,_advanced_propertycontractid_value&\$expand=invoice_details(\$select=priceperunit,_invoiceid_value,baseamount,quantity,productname;\$expand=productid(\$select=name,productnumber,productid))&\$filter=(_customerid_value eq ${Get.find<SessionServices>().currentUser.value.accountCustomerId}) and (invoice_details/any(o1:(o1/invoicedetailid ne null)))';
    var response = await NLTMAuthServices.client.get(Uri.parse(url));

    var decodeResponse =
        await NLTMAuthServices.decodeResponse(response: response);
    Get.log('=============== Invoices url :  $url ==========');
    Get.log('=============== Invoices response :  ${response.body} ==========');
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      return decodeResponse['value']
          .map<Invoice>((obj) => Invoice.fromJson(obj))
          .toList();
    } else {
      Get.showSnackbar(Ui.errorSnackBar(message: decodeResponse['message']));
      throw Exception(decodeResponse['message']);
    }
  } //b6cd583c-ef58-ed11-93c4-6045bd0f6dd1
}

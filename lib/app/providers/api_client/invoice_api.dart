import 'package:bareeq/app/models/invoice_item.dart';
import 'package:get/get.dart';
import '../../models/invoice.dart';
import '../../helper/api_helper.dart';
import '../../services/session_services.dart';
import '../../helper/token_helper.dart';

class InvoiceApi {
  /// Get all invoices
  static Future<List<Invoice>> getInvoices() async {
    String url =
        'invoices?\$select=totalamountlessfreight,_transactioncurrencyid_value,blser_paymenttype,freightamount,'
        'new_erpid,emailaddress,name,totalamount,blser_amountpaid,totallineitemamount,invoiceid,invoicenumber,'
        'prioritycode,createdon,datedelivered,_ownerid_value,blser_amountdueremaining,_customerid_value,paymenttermscode,'
        'statecode,totaldiscountamount,modifiedon,totaltax,statuscode,blser_paymentmethod,blser_erpinvoicetype,'
        'description,discountamount,discountpercentage,duedate,_advanced_propertycontractid_value&'
        '\$filter=(_customerid_value eq ${Get.find<SessionServices>().currentUser.value.accountCustomerId})&\$orderby=createdon desc';
    var response = await ApiHelper.getData(url: url);

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      var decodeResponse = await TokenHelper.decodeResponse(response: response);
      Get.log(
          '=============== Invoices response :  $decodeResponse ==========');
      return decodeResponse['value']
          .map<Invoice>((obj) => Invoice.fromJson(obj))
          .toList();
    } else {
      throw Exception(response.reasonPhrase.toString());
    }
  }

  static Future<List<InvoiceItem>> getInvoiceItems(
      {required String invoiceId}) async {
    String url = 'invoicedetails?\$select=priceperunit,baseamount,quantity,'
        'productname&\$expand=productid(\$select=name,productnumber,productid)'
        '&\$filter=(_invoiceid_value eq $invoiceId)&\$orderby=createdon desc';
    Get.log('=============== Invoices Items url :  $url ==========');
    var response = await ApiHelper.getData(url: url);

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      var decodeResponse = await TokenHelper.decodeResponse(response: response);
      Get.log(
          '=============== Invoices Items response :  $decodeResponse ==========');
      return decodeResponse['value']
          .map<InvoiceItem>((obj) => InvoiceItem.fromJson(obj))
          .toList();
    } else {
      Get.log(
          '=============== Invoices reason Phrase :  ${response.reasonPhrase} ==========');
      throw Exception(response.reasonPhrase.toString());
    }
  }
}

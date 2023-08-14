import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../common/constants.dart';
import '../../../common/widgets/ui.dart';
import '../../models/invoice.dart';
import '../../services/nltm_auhtorization_service.dart';
import '../../services/session_services.dart';

class InvoiceApi {
  /// Get all invoices
  static Future<List<Invoice>> getInvoices() async {
    String url =
        '${Constants
        .baseUrl}invoices?\$select=totalamountlessfreight,_transactioncurrencyid_value,blser_paymenttype,freightamount,new_erpid,emailaddress,name,totalamount,blser_amountpaid,totallineitemamount,invoiceid,invoicenumber,prioritycode,createdon,datedelivered,_ownerid_value,blser_amountdueremaining,_customerid_value,paymenttermscode,statecode,totaldiscountamount,modifiedon,totaltax,statuscode,blser_paymentmethod,blser_erpinvoicetype,description,discountamount,discountpercentage,duedate,_advanced_propertycontractid_value&\$expand=invoice_details(\$select=priceperunit,_invoiceid_value,baseamount,quantity,productname;\$expand=productid(\$select=name,productnumber,productid))&\$filter=(_customerid_value eq ${Get
        .find<SessionServices>()
        .currentUser
        .value
        .accountCustomerId}) and (invoice_details/any(o1:(o1/invoicedetailid ne null)))';
    var response = await NLTMAuthServices.client.get(Uri.parse(url));
    Get.log('=============== Invoices url :  $url ==========');
    Get.log('=============== Invoices response :  ${response.body} ==========');
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      var decodeResponse =
      await NLTMAuthServices.decodeResponse(response: response);
      return decodeResponse['value']
          .map<Invoice>((obj) => Invoice.fromJson(obj))
          .toList();
    } else {
      Get.showSnackbar(
          Ui.errorSnackBar(message: response.reasonPhrase.toString()));
      throw Exception(response.reasonPhrase.toString());
    }
  }
}
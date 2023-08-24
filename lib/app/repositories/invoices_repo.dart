import 'package:Bareeq/app/models/invoice_item.dart';

import '../models/invoice.dart';
import '../providers/api_client/invoice_api.dart';

class InvoicesRepo {
  Future<List<Invoice>> getInvoices() async {
    return InvoiceApi.getInvoices();
  }
  Future<List<InvoiceItem>> getInvoiceItems({required String invoiceId}) async {
    return InvoiceApi.getInvoiceItems(invoiceId :invoiceId);
  }
}

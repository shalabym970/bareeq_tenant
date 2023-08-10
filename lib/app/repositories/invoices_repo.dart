import '../models/invoice.dart';
import '../providers/api_client/invoice_api.dart';

class InvoicesRepo {
  Future<List<Invoice>> getInvoices() async {
    return InvoiceApi.getInvoices();
  }
}

import '../models/invoice.dart';
import '../providers/api_client_provider.dart';

class InvoicesRepository {
  Future<List<Invoice>> getInvoices() async {
    return ApiClientProvider.getInvoices();
  }
}

import 'package:Seef/app/models/invoice_details.dart';
import 'package:get/get.dart';

import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/invoice.dart';

class InvoiceDetailsController extends GetxController {
  final errorInvoiceItems = false.obs;
  final loadingInvoices = false.obs;
  final Invoice invoice = Get.arguments;
  final invoiceItems = <InvoiceDetails>[].obs;

  @override
  void onInit() {
    getInvoiceItems();
    super.onInit();
  }

  getInvoiceItems() async {
    try {
      loadingInvoices.value = true;
      invoiceItems.value = invoice.invoiceDetails!;
      Get.log(
          '=========== invoice Item list : ${invoiceItems.first.invoiceDetailsId} ==========');
    } catch (e) {
      errorInvoiceItems.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get invoice items : $e ==========');
    } finally {
      loadingInvoices.value = false;
    }
  }
}

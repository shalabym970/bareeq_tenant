import 'package:Seef/app/models/invoice_details.dart';
import 'package:get/get.dart';

import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/invoice.dart';
import '../../../models/message.dart';
import '../../../repositories/messages_repo.dart';

class InvoiceDetailsController extends GetxController {
  final errorInvoiceItems = false.obs;
  final loadingInvoices = false.obs;
  final Invoice invoice = Get.arguments;
  final invoiceItems = <InvoiceDetails>[].obs;
  final messages = <MessageModel>[].obs;
  final errorMessages = false.obs;
  final loadingMessages = false.obs;
  MessagesRepo messagesRepo = MessagesRepo();

  @override
  void onInit() {
    getInvoiceItems();
    getMessages();
    super.onInit();
  }

  getMessages() async {
    try {
      errorMessages.value = false;
      loadingMessages.value = true;
      messages
          .assignAll(await messagesRepo.getMessages(regardingId: invoice.id!));
    } catch (e) {
      errorMessages.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get invoice messages : $e ==========');
    } finally {
      loadingMessages.value = false;
    }
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

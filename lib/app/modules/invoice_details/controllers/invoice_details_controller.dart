import 'package:bareeq/app/models/invoice_item.dart';
import 'package:get/get.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/attachment.dart';
import '../../../models/invoice.dart';
import '../../../models/message.dart';
import '../../../repositories/attachment_repo.dart';
import '../../../repositories/invoices_repo.dart';
import '../../../repositories/messages_repo.dart';

class InvoiceDetailsController extends GetxController {
  final loadingInvoiceItems = false.obs;
  final loadingMessages = false.obs;
  final loadingAttachments = false.obs;
  final invoiceItems = <InvoiceItem>[].obs;
  final messages = <MessageModel>[].obs;
  final errorMessages = false.obs;
  final errorAttachments = false.obs;
  final errorInvoiceItems = false.obs;
  final attachments = <Attachment>[].obs;
  final attachmentRepo = AttachmentRepo();
  final messagesRepo = MessagesRepo();
  final invoiceRepo = InvoicesRepo();
  Invoice invoice = Get.arguments;

  @override
  void onInit() {
    getInvoiceItems();
    getMessages();
    getAttachments();
    super.onInit();
  }

  @override
  onClose() {
    Get.log('========== InvoiceDetailsController is closed =========');
    Get.delete<InvoiceDetailsController>();
  }

  getMessages() async {
    try {
      errorMessages.value = false;
      loadingMessages.value = true;
      messages.assignAll(
          await messagesRepo.getMessagesForRecord(regardingId: invoice.id!));
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
      errorInvoiceItems.value = false;
      loadingInvoiceItems.value = true;

      invoiceItems
          .assignAll(await invoiceRepo.getInvoiceItems(invoiceId: invoice.id!));
      Get.log(
          '=========== invoice Item list : ${invoiceItems.first.invoiceDetailsId} ==========');
    } catch (e) {
      errorInvoiceItems.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log(
          '========== Error when get invoice ${invoice.name.toString()} items : $e ==========');
    } finally {
      loadingInvoiceItems.value = false;
    }
  }

  getAttachments() async {
    try {
      errorAttachments.value = false;
      loadingAttachments.value = true;
      attachments.assignAll(
          await attachmentRepo.getAttachments(recordId: invoice.id!));
    } catch (e) {
      errorAttachments.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log(
          '========== Error when get ${invoice.name.toString()} Attachments : $e ==========');
    } finally {
      loadingAttachments.value = false;
    }
  }
}

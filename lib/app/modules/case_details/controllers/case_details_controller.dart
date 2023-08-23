import 'package:Bareeq/app/models/message.dart';
import 'package:get/get.dart';

import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/document.dart';
import '../../../repositories/attachment_repo.dart';
import '../../../repositories/messages_repo.dart';

class CaseDetailsController extends GetxController {
  final errorMessages = false.obs;
  final errorAttachments = false.obs;
  final loadingAttachments = false.obs;
  final loadingMessages = false.obs;
  final messages = <MessageModel>[].obs;
  final attachments = <Attachment>[].obs;
  final cases = Get.arguments;
  final messagesRepo = MessagesRepo();
  final attachmentRepo = AttachmentRepo();
  bool screenEdited = true;

  @override
  void onInit() async {
    getMessages();
    getAttachments();
    super.onInit();
  }

  @override
  onClose() {
    Get.log('========== CaseDetailsController is closed =========');
    Get.delete<CaseDetailsController>();
  }

  getMessages() async {
    try {
      errorMessages.value = false;
      loadingMessages.value = true;
      messages.assignAll(
          await messagesRepo.getMessagesForRecord(regardingId: cases.id!));
    } catch (e) {
      errorMessages.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get Cases messages : $e ==========');
    } finally {
      loadingMessages.value = false;
    }
  }

  getAttachments() async {
    try {
      errorAttachments.value = false;
      loadingAttachments.value = true;
      attachments
          .assignAll(await attachmentRepo.getAttachments(recordId: cases.id!));
    } catch (e) {
      errorAttachments.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get CPR Card Attachment : $e ==========');
    } finally {
      loadingAttachments.value = false;
    }
  }
}

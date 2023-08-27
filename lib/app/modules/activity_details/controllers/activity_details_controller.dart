import 'package:get/get.dart';

import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/document.dart';
import '../../../models/fit_out_step_model.dart';
import '../../../models/message.dart';
import '../../../repositories/attachment_repo.dart';
import '../../../repositories/messages_repo.dart';

class ActivityDetailsController extends GetxController {
  final loadingMessages = false.obs;
  final errorMessages = false.obs;
  final messages = <MessageModel>[].obs;
  final messagesRepo = MessagesRepo();
  final loadingAttachments = false.obs;
  final errorAttachments = false.obs;
  final attachments = <Attachment>[].obs;
  final attachmentRepo = AttachmentRepo();

  FitOutStepModel fitOutStep = Get.arguments;

  @override
  onInit() {
    getAttachments();
    getMessages();
    super.onInit();
  }

  getMessages() async {
    try {
      errorMessages.value = false;
      loadingMessages.value = true;
      messages.assignAll(
          await messagesRepo.getMessagesForRecord(regardingId: fitOutStep.id!));
    } catch (e) {
      errorMessages.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log(
          '========== Error when get fit Out step ${fitOutStep.name.toString()} messages : $e ==========');
    } finally {
      loadingMessages.value = false;
    }
  }

  getAttachments() async {
    try {
      errorAttachments.value = false;
      loadingAttachments.value = true;
      attachments.assignAll(
          await attachmentRepo.getAttachments(recordId: fitOutStep.id!));
    } catch (e) {
      errorAttachments.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log(
          '========== Error when fit Out step ${fitOutStep.name.toString()} Attachments : $e ==========');
    } finally {
      loadingAttachments.value = false;
    }
  }

  @override
  onClose() {
    Get.log('========== ActivityDetailsController is closed =========');
    Get.delete<ActivityDetailsController>();
  }
}

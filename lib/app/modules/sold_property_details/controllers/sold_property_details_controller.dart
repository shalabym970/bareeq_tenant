import 'package:bareeq/app/models/sold_property.dart';
import 'package:get/get.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/attachment.dart';
import '../../../models/message.dart';
import '../../../repositories/attachment_repo.dart';
import '../../../repositories/messages_repo.dart';

class SoldPropertyDetailsController extends GetxController {
  final messages = <MessageModel>[].obs;
  final errorMessages = false.obs;
  final loadingMessages = false.obs;
  final errorAttachments = false.obs;
  final loadingAttachments = false.obs;
  final attachments = <Attachment>[].obs;
  final attachmentRepo = AttachmentRepo();
  final messagesRepo = MessagesRepo();
  SoldProperty soldProperty = Get.arguments;

  @override
  onInit() {
    getMessages();
    getAttachments();
    super.onInit();
  }

  @override
  onClose() {
    Get.log('========== LeaseDetailsController is closed =========');
    Get.delete<SoldPropertyDetailsController>();
  }

  getMessages() async {
    try {
      errorMessages.value = false;
      loadingMessages.value = true;
      messages.assignAll(
          await messagesRepo.getMessagesForRecord(regardingId: soldProperty.id!));
    } catch (e) {
      errorMessages.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get lease messages : $e ==========');
    } finally {
      loadingMessages.value = false;
    }
  }

  getAttachments() async {
    try {
      errorAttachments.value = false;
      loadingAttachments.value = true;
      attachments.assignAll(
          await attachmentRepo.getAttachments(recordId: soldProperty.id!));
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

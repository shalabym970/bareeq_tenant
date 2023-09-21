import 'package:get/get.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/attachment.dart';
import '../../../models/leased_property.dart';
import '../../../models/message.dart';
import '../../../repositories/attachment_repo.dart';
import '../../../repositories/messages_repo.dart';
import '../../../services/check_internet_connection_service.dart';

class LeasedPropertyDetailsController extends GetxController {
  final messages = <MessageModel>[].obs;
  final errorMessages = false.obs;
  final loadingMessages = false.obs;
  final errorAttachments = false.obs;
  final loadingAttachments = false.obs;
  final attachments = <Attachment>[].obs;
  final attachmentRepo = AttachmentRepo();
  final messagesRepo = MessagesRepo();
  final connectionController = Get.find<InternetConnectionController>();

  LeasedProperty lease = Get.arguments;

  @override
  onInit() {
    getMessages();
    getAttachments();
    super.onInit();
  }

  @override
  onClose() {
    Get.log('========== LeaseDetailsController is closed =========');
    Get.delete<LeasedPropertyDetailsController>();
  }

  getMessages() async {
    try {
      errorMessages.value = false;
      loadingMessages.value = true;
      messages.assignAll(
          await messagesRepo.getMessagesForRecord(regardingId: lease.id!));
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
          await attachmentRepo.getAttachments(recordId: lease.id!));
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

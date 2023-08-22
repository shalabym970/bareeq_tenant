import 'package:get/get.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/document.dart';
import '../../../models/message.dart';
import '../../../repositories/attachment_repo.dart';

class MessageDetailsController extends GetxController {
  final rout = Get.arguments[0];
  MessageModel message = Get.arguments[1];
  final errorAttachments = false.obs;
  final loadingAttachments = false.obs;
  final attachments = <Attachment>[].obs;
  final attachmentRepo = AttachmentRepo();

  @override
  void onInit() async {
    getAttachments();
    super.onInit();
  }

  getAttachments() async {
    try {
      errorAttachments.value = false;
      loadingAttachments.value = true;
      attachments
          .assignAll(await attachmentRepo.getAttachments(recordId: message.activityId!));
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

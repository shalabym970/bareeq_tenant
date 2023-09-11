import 'dart:io';
import 'package:Bareeq/app/models/case_model.dart';
import 'package:Bareeq/app/models/message.dart';
import 'package:Bareeq/common/constants.dart';
import 'package:get/get.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/attachment.dart';
import '../../../repositories/attachment_repo.dart';
import '../../../repositories/messages_repo.dart';
import '../../../services/attachment_services.dart';
import '../../dashboard/controllers/dashboard_controller.dart';

class CaseDetailsController extends GetxController {
  final errorMessages = false.obs;
  final errorAttachments = false.obs;
  final loadingAttachments = false.obs;
  final loadingMessages = false.obs;
  final messages = <MessageModel>[].obs;
  final attachments = <Attachment>[].obs;
  final uploadedFiles = <File>[].obs;
  final uploadedAttachments = <Attachment>[].obs;
  final messagesRepo = MessagesRepo();
  final attachmentRepo = AttachmentRepo();
  final deletingLoading = false.obs;
  final submitLoading = false.obs;
  Case cases = Get.arguments;

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
      Get.log('========== Error when get Attachments : $e ==========');
    } finally {
      loadingAttachments.value = false;
    }
  }

  selectFiles() async {
    List<File>? list = await AttachmentServices.pickMultipleFiles();
    uploadedFiles.addAll(list!);
    list.clear();
  }

  deleteSelectedFile({required int index}) {
    uploadedFiles.removeAt(index);
  }

  saveCase() async {
    if (uploadedFiles.isNotEmpty) {
      try {
        submitLoading.value = true;
        uploadedAttachments.assignAll(
            await AttachmentServices.convertListOfFilesToListOfAttachments(
                files: uploadedFiles,
                objectId: cases.id!,
                objectTypeCode: Constants.caseTableName));
        await postAttachments();
        Ui.showToast(content: Strings.caseUpdatedSuccessfully);
        Get.back(result: Get.find<DashboardController>().getCases());
      } catch (e) {
        submitLoading.value = false;
        Get.showSnackbar(
            Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
        Get.log('========== Error when edit case : $e ==========');
      } finally {
        submitLoading.value = false;
      }
    }
  }

  /// post attachments
  postAttachments() async {
    try {
      if (uploadedAttachments.isNotEmpty) {
        await attachmentRepo.postAttachments(requests: uploadedAttachments);
      }
    } catch (e) {
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when post attachments: $e ==========');
    }
  }

  deleteAttachment({required Attachment attachment}) async {
    try {
      Get.back();
      deletingLoading.value = true;
      await attachmentRepo.deleteAttachment(attachmentId: attachment.id!);
      Ui.showToast(content: attachment.noteText! + Strings.hasBeenDeleted);
      getAttachments();
    } catch (e) {
      deletingLoading.value = false;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when delete attachment : $e ==========');
    } finally {
      deletingLoading.value = false;
    }
  }
}

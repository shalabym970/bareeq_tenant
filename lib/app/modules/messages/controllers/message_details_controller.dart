import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../common/constants.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/attachment.dart';
import '../../../models/message.dart';
import '../../../repositories/attachment_repo.dart';
import 'dart:io';
import '../../../repositories/messages_repo.dart';
import '../../../services/attachment_services.dart';
import '../../../services/check_internet_connection_service.dart';

class MessageDetailsController extends GetxController {
  final rout = Get.arguments[0];
  final replyController = TextEditingController();
  final replyKey = GlobalKey<FormState>();
  final replyLoading = false.obs;
  final errorAttachments = false.obs;
  final loadingAttachments = false.obs;
  final downloadedAttachments = <Attachment>[].obs;
  final attachmentRepo = AttachmentRepo();
  final uploadedFiles = <File>[].obs;
  final uploadedAttachments = <Attachment>[].obs;
  final _messagesRepo = MessagesRepo();
  final _replyMessage = MessageModel().obs;
  final connectionController = Get.find<InternetConnectionController>();
  MessageModel message = Get.arguments[1];

  @override
  void onInit() async {
    getAttachments();
    super.onInit();
  }

  getAttachments() async {
    try {
      errorAttachments.value = false;
      loadingAttachments.value = true;
      downloadedAttachments.assignAll(
          await attachmentRepo.getAttachments(recordId: message.activityId!));
    } catch (e) {
      errorAttachments.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get CPR Card Attachment : $e ==========');
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

  reply() async {
    try {
      if (replyKey.currentState!.validate()) {
        replyKey.currentState?.save();
        replyLoading.value = true;
        _replyMessage.value = MessageModel(
          subject: message.subject!.contains("Re:")
              ? message.subject!.toString()
              : "Re: ${message.subject!.toString()}",
          regardingName: message.regardingName,
          regardingId: message.regardingId,
          messageBody: replyController.text,
          readStatus: true,
          direction: true,
          priorityCode: Constants.messagePriorityMap["Normal"],
          scheduledStart: DateTime.now().add(const Duration(hours: 3)),
        );
        String messageId =
            await _messagesRepo.replyMessage(request: _replyMessage.value);
        Get.log('========== message id : $messageId ==========');
        await convertFilesToAttachment(messageId: messageId);

        Ui.showToast(content: Strings.messageReplayed);
        Get.back();
      }
    } catch (e) {
      replyLoading.value = false;
      Get.showSnackbar(Ui.errorSnackBar(message: ErrorStrings.failedReply));
    } finally {
      replyLoading.value = false;
    }
  }

  convertFilesToAttachment({required String messageId}) async {
    if (uploadedFiles.isNotEmpty) {
      try {
        replyLoading.value = true;
        uploadedAttachments.assignAll(
            await AttachmentServices.convertListOfFilesToListOfAttachments(
                files: uploadedFiles,
                objectId: messageId,
                objectTypeCode: Constants.messageKey));
        await postAttachments();
      } catch (e) {
        Get.log('========== Error when add attachments : $e ==========');
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
      Get.log('========== Error when post attachments: $e ==========');
    }
  }
}

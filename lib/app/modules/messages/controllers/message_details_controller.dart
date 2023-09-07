import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/document.dart';
import '../../../models/message.dart';
import '../../../repositories/attachment_repo.dart';
import 'dart:io';

import '../../../services/attachment_services.dart';
class MessageDetailsController extends GetxController {
  final rout = Get.arguments[0];
  final replyController = TextEditingController();
  final replyKey = GlobalKey<FormState>();
  final replyLoading = false.obs;
  final errorAttachments = false.obs;
  final loadingAttachments = false.obs;
  final attachments = <Attachment>[].obs;
  final attachmentRepo = AttachmentRepo();
  final uploadedFiles = <File>[].obs;
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
      attachments.assignAll(
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

  //Todo : don't miss to implement this reply  attachment  and message method

  reply() async {
    try {
      if (replyKey.currentState!.validate()) {
        replyKey.currentState?.save();
        replyLoading.value = true;
        // _contact.value = Contact(
        //     id: Get.find<SessionServices>().currentUser.value.id,
        //     password: newPassController.text);
        // await profileRepo.updateProfile(request: _contact.value);
        //
        Ui.showToast(content: Strings.mesaageReplyed);
        Get.back();
      }
    } catch (e) {
      replyLoading.value = false;
      Get.showSnackbar(Ui.errorSnackBar(message: ErrorStrings.failedReply));
    } finally {
      replyLoading.value = false;
    }
  }
}

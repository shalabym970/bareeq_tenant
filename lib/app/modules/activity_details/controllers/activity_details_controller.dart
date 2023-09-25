import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import '../../../../common/constants.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/attachment.dart';
import '../../../models/fit_out_step_model.dart';
import '../../../models/message.dart';
import '../../../repositories/attachment_repo.dart';
import '../../../repositories/messages_repo.dart';
import '../../../services/attachment_services.dart';
import '../../../services/check_internet_connection_service.dart';
import '../../fit_out_process_details/controllers/fit_out_process_details_controller.dart';

class ActivityDetailsController extends GetxController {
  final loadingMessages = false.obs;
  final errorMessages = false.obs;
  final messages = <MessageModel>[].obs;
  final messagesRepo = MessagesRepo();
  final loadingAttachments = false.obs;
  final errorAttachments = false.obs;
  final attachments = <Attachment>[].obs;
  final uploadedFiles = <File>[].obs;
  final uploadedAttachments = <Attachment>[].obs;
  final attachmentRepo = AttachmentRepo();
  final submitLoading = false.obs;
  final deletingLoading = false.obs;
  final connectionController = Get.find<InternetConnectionController>();

  FitOutStepModel fitOutStep = Get.arguments;

  @override
  onInit() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      getAttachments();
      getMessages();
      super.onInit();
    }
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

  selectFiles() async {
    List<File>? list = await AttachmentServices.pickMultipleFiles();
    uploadedFiles.addAll(list!);
    list.clear();
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

  saveActivity() async {
    if (uploadedFiles.isNotEmpty) {
      try {
        submitLoading.value = true;
        uploadedAttachments.assignAll(
            await AttachmentServices.convertListOfFilesToListOfAttachments(
                files: uploadedFiles,
                objectId: fitOutStep.id!,
                objectTypeCode: Constants.fitOutStepTableName));
        await postAttachments();
        Ui.showToast(content: Strings.fitOutStepUpdatedSuccessfully);
        Get.back(
            result:
                Get.find<FitOutProcessDetailsController>().getFitOutSteps());
      } catch (e) {
        submitLoading.value = false;
        Get.showSnackbar(
            Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
        Get.log('========== Error when edit fit out step : $e ==========');
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

  deleteSelectedFile({required int index}) {
    uploadedFiles.removeAt(index);
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

  @override
  onClose() {
    Get.log('========== ActivityDetailsController is closed =========');
    Get.delete<ActivityDetailsController>();
  }
}

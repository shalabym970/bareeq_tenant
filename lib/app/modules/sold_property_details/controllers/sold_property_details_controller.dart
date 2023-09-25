import 'dart:io';
import 'package:bareeq/app/models/sold_property.dart';
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:mime/mime.dart';
import '../../../../common/constants.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/attachment.dart';
import '../../../models/contact_model.dart';
import '../../../models/message.dart';
import '../../../repositories/attachment_repo.dart';
import '../../../repositories/messages_repo.dart';
import '../../../services/attachment_services.dart';
import '../../../services/check_internet_connection_service.dart';
import '../../../services/session_services.dart';
import '../../properties/controllers/properties_controller.dart';

class SoldPropertyDetailsController extends GetxController {
  final messages = <MessageModel>[].obs;
  final errorMessages = false.obs;
  final loadingMessages = false.obs;
  final errorAttachments = false.obs;
  final loadingAttachments = false.obs;
  final submitLoading = false.obs;
  final deletingLoading = false.obs;
  final downloadedAttachments = <Attachment>[].obs;
  final attachmentRepo = AttachmentRepo();
  final messagesRepo = MessagesRepo();
  final attachFile = Rxn<File>();
  final uploadedAttachments = <Attachment>[].obs;
  final connectionController = Get.find<InternetConnectionController>();

  File? file;
  SoldProperty soldProperty = Get.arguments;

  Contact get currentUser {
    return Get.find<SessionServices>().currentUser.value;
  }

  @override
  onInit() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      getMessages();
      getAttachments();
      super.onInit();
    }
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
      messages.assignAll(await messagesRepo.getMessagesForRecord(
          regardingId: soldProperty.id!));
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
      downloadedAttachments.assignAll(
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

  selectFile() async {
    file = await AttachmentServices.pickFile();
    attachFile.value =
        attachFile.value != null && file == null ? attachFile.value : file;
    file = null;
  }

  convertFileToAttachment() async {
    try {
      if (attachFile.value != null) {
        String? base64Body = await AttachmentServices.convertFileToBase64(
            file: attachFile.value!);
        String? mimeType = lookupMimeType(attachFile.value!.path);
        if (downloadedAttachments.isEmpty) {
          String fileName = attachFile.value!.path.split('/').last;
          uploadedAttachments.add(Attachment(
            noteText: fileName,
            filename: fileName,
            objectIdValue: soldProperty.id.toString(),
            objectTypeCode: Constants.soldPropertyTableName,
            documentBody: base64Body,
            mimeType: mimeType,
          ));
          await postAttachments();
        } else {
          downloadedAttachments.first.mimeType = mimeType;
          downloadedAttachments.first.documentBody = base64Body;
          await updateAttachment(attachment: downloadedAttachments.first);
        }
      }
    } catch (e) {
      Get.log('========== Error when add attachments : $e ==========');
    }
  }

  updateAttachment({required Attachment attachment}) async {
    try {
      await attachmentRepo.updateAttachment(attachment: attachment);
    } catch (e) {
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when post attachments: $e ==========');
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

  saveProperty() async {
    try {
      if (attachFile.value != null) {
        submitLoading.value = true;
        await convertFileToAttachment();

        Ui.showToast(content: Strings.workPermitUpdatedSuccessfully);
        Get.back(result: Get.find<PropertiesController>().getSoldProperties());
      } else {
        Ui.showToast(content: Strings.dontChangedAnyThing);
      }
    } catch (e) {
      submitLoading.value = false;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when edit Work Permit : $e ==========');
    } finally {
      submitLoading.value = false;
    }
  }

  deleteAttachment({required Attachment attachment}) async {
    try {
      Get.back();
      deletingLoading.value = true;
      await attachmentRepo.deleteAttachment(attachmentId: attachment.id!);
      getAttachments();
      Ui.showToast(content: attachment.noteText! + Strings.hasBeenDeleted);
    } catch (e) {
      deletingLoading.value = false;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when delete attachament : $e ==========');
    } finally {
      deletingLoading.value = false;
    }
  }
}

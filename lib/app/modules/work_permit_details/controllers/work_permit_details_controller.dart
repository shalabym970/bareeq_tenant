import 'package:bareeq/app/models/attachment.dart';
import 'package:bareeq/app/models/work_permit_item.dart';
import 'package:bareeq/app/repositories/attachment_repo.dart';
import 'package:bareeq/app/repositories/messages_repo.dart';
import 'package:bareeq/common/constants.dart';
import 'package:get/get.dart';
import 'package:mime/mime.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/message.dart';
import '../../../models/work_permit.dart';
import '../../../repositories/work_permit_repo.dart';
import 'dart:io';
import '../../../services/attachment_services.dart';
import '../../dashboard/controllers/dashboard_controller.dart';

class WorkPermitDetailsController extends GetxController {
  final loadingWorkPermitItems = false.obs;
  final loadingMessages = false.obs;
  final loadingAttachments = false.obs;
  final errorWorkPermitItems = false.obs;
  final errorMessages = false.obs;
  final workPermitItems = <WorkPermitItem>[].obs;
  final messages = <MessageModel>[].obs;
  final loadingCprAttach = false.obs;
  final loadingInsuranceAttach = false.obs;
  final loadingMethodAttach = false.obs;
  final loadingRiskAttach = false.obs;
  final errorCprAttach = false.obs;
  final errorInsuranceAttach = false.obs;
  final errorMethodAttach = false.obs;
  final errorRiskAttach = false.obs;
  final cprFile = Rxn<File>();
  final insuranceFile = Rxn<File>();
  final methodFile = Rxn<File>();
  final riskFile = Rxn<File>();
  final cprAttach = <Attachment>[].obs;
  final insuranceAttach = <Attachment>[].obs;
  final methodAttach = <Attachment>[].obs;
  final riskAttach = <Attachment>[].obs;
  final submitLoading = false.obs;
  final deletingLoading = false.obs;
  final uploadedAttachmentList = <Attachment>[].obs;
  final workPermitRepo = WorkPermitRepo();
  final messagesRepo = MessagesRepo();
  final attachmentRepo = AttachmentRepo();
  WorkPermit workPermit = Get.arguments;
  File? file;

  @override
  onInit() {
    getWorkPermitItems();
    getMessages();
    getAttachments();
    methodFile.value = null;
    riskFile.value = null;
    insuranceFile.value = null;
    cprFile.value = null;
    Get.log('=========== workPermit id :  ${workPermit.id} ===========');
    super.onInit();
  }

  @override
  onClose() {
    Get.log('========== WorkPermitDetailsController is closed =========');
    Get.delete<WorkPermitDetailsController>();
  }

  getMessages() async {
    try {
      errorMessages.value = false;
      loadingMessages.value = true;
      messages.assignAll(
          await messagesRepo.getMessagesForRecord(regardingId: workPermit.id!));
    } catch (e) {
      errorMessages.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get messages : $e ==========');
    } finally {
      loadingMessages.value = false;
    }
  }

  getWorkPermitItems() async {
    try {
      errorWorkPermitItems.value = false;
      loadingWorkPermitItems.value = true;
      workPermitItems.assignAll(await workPermitRepo.getWorkPermitItems(
          workPermitId: workPermit.id!));
    } catch (e) {
      errorWorkPermitItems.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get Work Permit items : $e ==========');
    } finally {
      loadingWorkPermitItems.value = false;
    }
  }

  getAttachments() {
    getCprAttach();
    getInsuranceAttach();
    getMethodAttach();
    getRiskAttach();
  }

  getCprAttach() async {
    try {
      errorCprAttach.value = false;
      loadingCprAttach.value = true;
      cprAttach.assignAll(await attachmentRepo.getAttachments(
          recordId: workPermit.id!,
          attachmentType: Constants.workPermitCprCardsAttachment));
    } catch (e) {
      errorCprAttach.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get CPR Card Attachment : $e ==========');
    } finally {
      loadingCprAttach.value = false;
    }
  }

  getInsuranceAttach() async {
    try {
      errorInsuranceAttach.value = false;
      loadingInsuranceAttach.value = true;
      insuranceAttach.assignAll(await attachmentRepo.getAttachments(
          recordId: workPermit.id!,
          attachmentType: Constants.workPermitInsuranceAttachment));
    } catch (e) {
      errorInsuranceAttach.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get Insurance Attachment : $e ==========');
    } finally {
      loadingInsuranceAttach.value = false;
    }
  }

  getMethodAttach() async {
    try {
      errorMethodAttach.value = false;
      loadingMethodAttach.value = true;
      methodAttach.assignAll(await attachmentRepo.getAttachments(
          recordId: workPermit.id!,
          attachmentType: Constants.workPermitMethodStatementAttachment));
    } catch (e) {
      errorMethodAttach.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log(
          '========== Error when get Method Statment Attachment : $e ==========');
    } finally {
      loadingMethodAttach.value = false;
    }
  }

  getRiskAttach() async {
    try {
      errorRiskAttach.value = false;
      loadingRiskAttach.value = true;
      riskAttach.assignAll(await attachmentRepo.getAttachments(
          recordId: workPermit.id!,
          attachmentType: Constants.workPermitRiskAssessmentAttachment));
    } catch (e) {
      errorRiskAttach.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get Risk Attachment : $e ==========');
    } finally {
      loadingRiskAttach.value = false;
    }
  }

  selectFile({required String fileType}) async {
    if (fileType == Constants.cprFile) {
      file = await AttachmentServices.pickFile();
      cprFile.value =
          cprFile.value != null && file == null ? cprFile.value : file;
      file = null;
    } else if (fileType == Constants.insuranceFile) {
      file = await AttachmentServices.pickFile();
      insuranceFile.value = insuranceFile.value != null && file == null
          ? insuranceFile.value
          : file;
      file = null;
    } else if (fileType == Constants.methodFile) {
      file = await AttachmentServices.pickFile();
      methodFile.value =
          methodFile.value != null && file == null ? methodFile.value : file;
      file = null;
    } else {
      file = await AttachmentServices.pickFile();
      riskFile.value =
          riskFile.value != null && file == null ? riskFile.value : file;
      file = null;
    }
  }

  saveWorkPermit() async {
    if (cprFile.value != null ||
        insuranceFile.value != null ||
        methodFile.value != null ||
        riskFile.value != null) {
      try {
        submitLoading.value = true;
        await addAllFilesToAttachmentList(workPermitId: workPermit.id!);
        await postAttachments();
        Ui.showToast(content: Strings.workPermitUpdatedSuccessfully);
        Get.back(result: Get.find<DashboardController>().getWorkPermits());
      } catch (e) {
        submitLoading.value = false;
        Get.showSnackbar(
            Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
        Get.log('========== Error when edit Work Permit : $e ==========');
      } finally {
        submitLoading.value = false;
      }
    } else {
      Ui.showToast(content: Strings.dontChangedAnyThing);
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

  /// post attachments
  postAttachments() async {
    try {
      if (uploadedAttachmentList.isNotEmpty) {
        await attachmentRepo.postAttachments(requests: uploadedAttachmentList);
      }
    } catch (e) {
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when post attachments: $e ==========');
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

  /// fill attachment list by files
  addAllFilesToAttachmentList({required String workPermitId}) async {
    if (insuranceFile.value != null) {
      String? base64Body = await AttachmentServices.convertFileToBase64(
          file: insuranceFile.value!);
      String? mimeType = lookupMimeType(insuranceFile.value!.path);
      if (insuranceAttach.isEmpty) {
        Get.log('========== insurance file base64Body : $mimeType ==========');
        uploadedAttachmentList.add(Attachment(
          noteText: Constants.workPermitInsuranceAttachment,
          filename: Constants.workPermitInsuranceAttachment,
          objectIdValue: workPermitId.toString(),
          objectTypeCode: Constants.workPermitTableName,
          documentBody: base64Body,
          mimeType: mimeType,
        ));
      } else {
        insuranceAttach.first.mimeType = mimeType;
        insuranceAttach.first.documentBody = base64Body;
        await updateAttachment(attachment: insuranceAttach.first);
      }
    }
    if (cprFile.value != null) {
      String? base64Body =
          await AttachmentServices.convertFileToBase64(file: cprFile.value!);
      String? mimeType = lookupMimeType(cprFile.value!.path);
      if (cprAttach.isEmpty) {
        Get.log('========== cpr file base64Body : $mimeType ==========');
        uploadedAttachmentList.add(Attachment(
          noteText: Constants.workPermitCprCardsAttachment,
          filename: Constants.workPermitCprCardsAttachment,
          objectIdValue: workPermitId.toString(),
          objectTypeCode: Constants.workPermitTableName,
          documentBody: base64Body,
          mimeType: mimeType,
        ));
      } else {
        cprAttach.first.mimeType = mimeType;
        cprAttach.first.documentBody = base64Body;
        await updateAttachment(attachment: cprAttach.first);
      }
    }
    if (methodFile.value != null) {
      String? base64Body =
          await AttachmentServices.convertFileToBase64(file: methodFile.value!);
      String? mimeType = lookupMimeType(methodFile.value!.path);
      if (methodAttach.isEmpty) {
        Get.log('========== method file base64Body : $mimeType ==========');
        uploadedAttachmentList.add(Attachment(
          noteText: Constants.workPermitMethodStatementAttachment,
          filename: Constants.workPermitMethodStatementAttachment,
          objectIdValue: workPermitId.toString(),
          objectTypeCode: Constants.workPermitTableName,
          documentBody: base64Body,
          mimeType: mimeType,
        ));
      } else {
        methodAttach.first.mimeType = mimeType;
        methodAttach.first.documentBody = base64Body;
        await updateAttachment(attachment: methodAttach.first);
      }
    }
    if (riskFile.value != null) {
      String? base64Body =
          await AttachmentServices.convertFileToBase64(file: riskFile.value!);
      String? mimeType = lookupMimeType(riskFile.value!.path);
      if (riskAttach.isEmpty) {
        Get.log('========== riskFile file base64Body : $mimeType ==========');
        uploadedAttachmentList.add(Attachment(
          noteText: Constants.workPermitRiskAssessmentAttachment,
          filename: Constants.workPermitRiskAssessmentAttachment,
          objectIdValue: workPermitId.toString(),
          objectTypeCode: Constants.workPermitTableName,
          documentBody: base64Body,
          mimeType: mimeType,
        ));
      } else {
        riskAttach.first.mimeType = mimeType;
        riskAttach.first.documentBody = base64Body;
        await updateAttachment(attachment: riskAttach.first);
      }
    }
  }
}

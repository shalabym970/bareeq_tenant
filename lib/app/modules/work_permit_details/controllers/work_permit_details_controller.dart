import 'package:Bareeq/app/models/document.dart';
import 'package:Bareeq/app/models/work_permit_item.dart';
import 'package:Bareeq/app/repositories/attachment_repo.dart';
import 'package:Bareeq/app/repositories/messages_repo.dart';
import 'package:Bareeq/common/constants.dart';
import 'package:get/get.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/message.dart';
import '../../../models/work_permit.dart';
import '../../../repositories/work_permit_repo.dart';
import 'dart:io';
import '../../../services/attachment_services.dart';

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
  WorkPermitRepo workPermitRepo = WorkPermitRepo();
  MessagesRepo messagesRepo = MessagesRepo();
  AttachmentRepo attachmentRepo = AttachmentRepo();
  WorkPermit workPermit = Get.arguments;
  File? file;

  @override
  onInit() {
    getWorkPermitItems();
    getMessages();
    getCprAttach();
    getInsuranceAttach();
    getMethodAttach();
    getRiskAttach();
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
  //Todo : don't miss to implement this save work permit method
  saveWorkPermit() {
    try {
      submitLoading.value = true;
      Get.back();
    } catch (e) {
      submitLoading.value = false;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when edit Work Permit : $e ==========');
    } finally {
      submitLoading.value = false;
    }
  }

  //Todo : don't miss to implement this delete attachment method
  deleteAttachament() {
    try {
      Get.back();
      submitLoading.value = true;
    } catch (e) {
      submitLoading.value = false;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when delete attachament : $e ==========');
    } finally {
      submitLoading.value = false;
    }
  }
}
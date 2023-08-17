
import 'package:Seef/app/models/document.dart';
import 'package:Seef/app/models/work_permit_item.dart';
import 'package:Seef/app/repositories/messages_repo.dart';
import 'package:Seef/common/constants.dart';
import 'package:get/get.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/message.dart';
import '../../../models/work_permit.dart';
import '../../../repositories/work_permit_repo.dart';

class WorkPermitDetailsController extends GetxController {
  final loadingWorkPermitItems = false.obs;
  final loadingMessages = false.obs;
  final loadingAttachments = false.obs;
  final errorWorkPermitItems = false.obs;
  final errorMessages = false.obs;
  final workPermitItems = <WorkPermit>[].obs;
  final messages = <MessageModel>[].obs;
  final loadingCprAttach = false.obs;
  final loadingInsuranceAttach = false.obs;
  final loadingMethodAttach = false.obs;
  final loadingRiskAttach = false.obs;
  final errorCprAttach = false.obs;
  final errorInsuranceAttach = false.obs;
  final errorMethodAttach = false.obs;
  final errorRiskAttach = false.obs;
  final cprAttach = Attachment().obs;
  final insuranceAttach = Attachment().obs;
  final methodAttach = Attachment().obs;
  final riskAttach = Attachment().obs;
  WorkPermitRepo workPermitRepo = WorkPermitRepo();
  MessagesRepo messagesRepo = MessagesRepo();
  WorkPermitModel workPermit = Get.arguments;

  @override
  onInit() {
    getWorkPermitItems();
    getMessages();
    getCprAttach();
    getInsuranceAttach();
    getMethodAttach();
    getRiskAttach();
    Get.log(
        '=========== workPermit id :  ${workPermit.workPermitId} ===========');
    super.onInit();
  }

  getMessages() async {
    try {
      errorMessages.value = false;
      loadingMessages.value = true;
      messages.assignAll(await messagesRepo.getMessagesForRecord(
          regardingId: workPermit.workPermitId!));
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
          workPermitId: workPermit.workPermitId!));

      Get.log(
          '=========== Work Permit items list : ${workPermitItems.first.id} ==========');
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
      cprAttach.value = await workPermitRepo.getWorkPermitAttachment(
          workPermitId: workPermit.workPermitId!,
          attachmentType: Constants.workPermitCprCardsAttachment);
      Get.log(
          '=========== CPR card Attachment id : ${cprAttach.value.id.toString()} ==========');
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
      insuranceAttach.value = await workPermitRepo.getWorkPermitAttachment(
          workPermitId: workPermit.workPermitId!,
          attachmentType: Constants.workPermitInsuranceAttachment);
      Get.log(
          '=========== Insurance Attachment id : ${insuranceAttach.value.id.toString()} ==========');
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
      methodAttach.value = await workPermitRepo.getWorkPermitAttachment(
          workPermitId: workPermit.workPermitId!,
          attachmentType: Constants.workPermitMethodStatementAttachment);
      Get.log(
          '=========== Method Statment Attachment id : ${methodAttach.value.id.toString()} ==========');
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
      riskAttach.value = await workPermitRepo.getWorkPermitAttachment(
          workPermitId: workPermit.workPermitId!,
          attachmentType: Constants.workPermitRiskAssessmentAttachment);
      Get.log(
          '=========== Risk Attachment id : ${riskAttach.value.id.toString()} ==========');
    } catch (e) {
      errorRiskAttach.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get Risk Attachment : $e ==========');
    } finally {
      loadingRiskAttach.value = false;
    }
  }


}

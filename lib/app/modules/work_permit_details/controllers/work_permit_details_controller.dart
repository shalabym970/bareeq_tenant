import 'package:Seef/app/models/work_permit_item.dart';
import 'package:Seef/app/repositories/messages_repo.dart';
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
  final errorAttachments = false.obs;
  final workPermitItems = <WorkPermitItem>[].obs;
  final messages = <MessageModel>[].obs;
  WorkPermitRepo workPermitRepo = WorkPermitRepo();
  MessagesRepo messagesRepo = MessagesRepo();
  WorkPermit workPermit = Get.arguments;

  @override
  onInit() {
    getWorkPermitItems();
    getMessages();
    super.onInit();
  }

  getMessages() async {
    try {
      errorMessages.value = false;
      loadingMessages.value = true;
      messages.assignAll(await messagesRepo.getMessages(
          regardingId: workPermit.workPermitId!));

      Get.log(
          '=========== messages list : ${workPermitItems.first.id} ==========');
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
}

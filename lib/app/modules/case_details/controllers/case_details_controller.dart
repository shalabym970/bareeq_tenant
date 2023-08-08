import 'package:Seef/app/models/case_model.dart';
import 'package:Seef/app/models/message.dart';
import 'package:get/get.dart';

import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../repositories/messages_repo.dart';

class CaseDetailsController extends GetxController {
  final errorMessages = false.obs;
  final loadingMessages = false.obs;
  final messages = <MessageModel>[].obs;
  Case cases = Get.arguments;
  MessagesRepo messagesRepo = MessagesRepo();

  @override
  void onInit() async {
    await getMessages();
    super.onInit();
  }

  getMessages() async {
    try {
      errorMessages.value = false;
      loadingMessages.value = true;
      messages
          .assignAll(await messagesRepo.getMessages(regardingId: cases.id!));
    } catch (e) {
      errorMessages.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get Cases messages : $e ==========');
    } finally {
      loadingMessages.value = false;
    }
  }
}

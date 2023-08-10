import 'package:get/get.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/lease_model.dart';
import '../../../models/message.dart';
import '../../../repositories/messages_repo.dart';

class LeaseDetailsController extends GetxController {
  final messages = <MessageModel>[].obs;
  final errorMessages = false.obs;
  final loadingMessages = false.obs;
  MessagesRepo messagesRepo = MessagesRepo();
  LeaseModel lease = Get.arguments;
  getMessages() async {
    try {
      errorMessages.value = false;
      loadingMessages.value = true;
      messages
          .assignAll(await messagesRepo.getMessages(regardingId: lease.id!));
    } catch (e) {
      errorMessages.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get lease messages : $e ==========');
    } finally {
      loadingMessages.value = false;
    }
  }

}
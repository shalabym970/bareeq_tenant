import 'package:bareeq/app/models/message.dart';
import 'package:bareeq/app/repositories/messages_repo.dart';
import 'package:bareeq/common/constants.dart';
import 'package:get/get.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../services/check_internet_connection_service.dart';

class MessagesController extends GetxController {
  final selectInboxMessages = true.obs;
  final selectedValue = "all".obs;
  final allMessages = <MessageModel>[].obs;
  final inboxMessages = <MessageModel>[].obs;
  final sentMessages = <MessageModel>[].obs;
  final loading = false.obs;
  final error = false.obs;
  final messagesRepo = MessagesRepo();
  final connectionController = Get.find<InternetConnectionController>();


  Map<String, String> messageType = {
    Constants.allKey: "All",
    Constants.workPermitKey: 'Work Permits',
    Constants.caseKey: 'Cases',
    Constants.invoiceKey: 'Invoices',
    Constants.leaseKey: 'Leases',
    Constants.fitOutKey: 'Fit Out Process',
    Constants.fitOutStepsKey: 'Fit Out Process Steps',
  };

  @override
  void onInit() {
    getMessages();
    super.onInit();
  }

  void getMessages() async {
    try {
      error.value = false;
      loading.value = true;
      inboxMessages.clear();
      sentMessages.clear();
      if (selectInboxMessages.value == true) {
        inboxMessages.assignAll(await messagesRepo.getAllMessages(
            isInbox: selectInboxMessages.value, type: selectedValue.value));
        filterMessages();
      } else {
        sentMessages.assignAll(await messagesRepo.getAllMessages(
            isInbox: selectInboxMessages.value, type: selectedValue.value));
        filterMessages();
      }
    } catch (e) {
      error.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get Messages : $e ==========');
    } finally {
      loading.value = false;
    }
  }

  filterMessages() {
    if (selectedValue.value != Constants.allKey) {
      if (selectedValue.value == Constants.workPermitKey) {
        inboxMessages.value = inboxMessages
            .where(
                (message) => message.regardingName == Constants.workPermitKey)
            .toList();
        sentMessages.value = sentMessages
            .where(
                (message) => message.regardingName == Constants.workPermitKey)
            .toList();
      } else if (selectedValue.value == Constants.caseKey) {
        inboxMessages.value = inboxMessages
            .where((message) => message.regardingName == Constants.caseKey)
            .toList();
        sentMessages.value = sentMessages
            .where((message) => message.regardingName == Constants.caseKey)
            .toList();
      } else if (selectedValue.value == Constants.invoiceKey) {
        inboxMessages.value = inboxMessages
            .where((message) => message.regardingName == Constants.invoiceKey)
            .toList();
        sentMessages.value = sentMessages
            .where((message) => message.regardingName == Constants.invoiceKey)
            .toList();
      } else if (selectedValue.value == Constants.leaseKey) {
        inboxMessages.value = inboxMessages
            .where((message) => message.regardingName == Constants.leaseKey)
            .toList();
        sentMessages.value = sentMessages
            .where((message) => message.regardingName == Constants.leaseKey)
            .toList();
      } else {
        inboxMessages.value = inboxMessages
            .where((message) => message.regardingName == Constants.fitOutKey)
            .toList();
        sentMessages.value = sentMessages
            .where((message) => message.regardingName == Constants.fitOutKey)
            .toList();
      }
    }
  }
}

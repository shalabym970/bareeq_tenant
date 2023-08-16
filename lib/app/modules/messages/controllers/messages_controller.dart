import 'package:Seef/app/models/message.dart';
import 'package:Seef/app/repositories/messages_repo.dart';
import 'package:Seef/common/constants.dart';
import 'package:get/get.dart';

import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/ui.dart';

class MessagesController extends GetxController {
  final selectInboxMessages = true.obs;
  final selectedValue = "all".obs;
  final allMessages = <MessageModel>[].obs;
  final inboxMessages = <MessageModel>[].obs;
  final sentMessages = <MessageModel>[].obs;
  final loading = false.obs;
  final error = false.obs;
  MessagesRepo messagesRepo = MessagesRepo();

  Map<String, String> messageType = {
    Constants.allKey: "All",
    Constants.workPermitKey: 'Work Permits',
    Constants.caseKey: 'Cases',
    Constants.invoiceKey: 'Invoices',
    Constants.leaseKey: 'Leases',
    Constants.fitOutKey: 'Fit Out Process',
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
      allMessages.assignAll(await messagesRepo.getMessages());
      if (allMessages.isNotEmpty) {
        for (var element in allMessages) {
          if (element.direction == true) {
            sentMessages.add(element);
            sentMessages.sort((a, b) => b.createdOn!.compareTo(a.createdOn!));
          } else {
            inboxMessages.add(element);
            inboxMessages.sort((a, b) => b.createdOn!.compareTo(a.createdOn!));
          }
        }


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
}

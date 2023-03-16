import 'package:Seef/app/models/case_model.dart';
import 'package:Seef/app/models/message.dart';
import 'package:get/get.dart';

import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/ui.dart';

class CaseDetailsController extends GetxController {
  final errorMessages = false.obs;
  final loadingMessages = false.obs;
  final messages = <MessageModel>[].obs;
  final Case recentCases = Get.arguments;

  @override
  void onInit() async {
    await getMessages();
    super.onInit();
  }

  getMessages() async {
    try {
      loadingMessages.value = true;
      messages.value = recentCases.messages!;
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

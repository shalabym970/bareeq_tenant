import 'package:Seef/app/models/fit_out_model.dart';
import 'package:Seef/app/models/fit_out_step_model.dart';
import 'package:Seef/app/repositories/fit_out_repo.dart';
import 'package:Seef/common/strings/strings.dart';
import 'package:get/get.dart';
import '../../../../common/status_no.dart';
import '../../../../common/status_string.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/message.dart';
import '../../../repositories/messages_repo.dart';

class FitOutProcessDetailsController extends GetxController {
  final errorMessages = false.obs;
  final errorFitOutSteps = false.obs;
  final loadingMessages = false.obs;
  final loadingFitOutSteps = false.obs;
  final messages = <MessageModel>[].obs;
  final fitOutSteps = <FitOutStepModel>[].obs;
  FitOutModel fitOut = Get.arguments;
  MessagesRepo messagesRepo = MessagesRepo();
  FitOutRepo fitOutRepo = FitOutRepo();

  @override
  void onInit() async {
    getMessages();
    getFitOutSteps();
    super.onInit();
  }

  getMessages() async {
    try {
      errorMessages.value = false;
      loadingMessages.value = true;
      messages
          .assignAll(await messagesRepo.getMessagesForRecord(regardingId: fitOut.id!));
    } catch (e) {
      errorMessages.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get fit Out messages : $e ==========');
    } finally {
      loadingMessages.value = false;
    }
  }

  getFitOutSteps() async {
    try {
      errorFitOutSteps.value = false;
      loadingFitOutSteps.value = true;
      fitOutSteps
          .assignAll(await fitOutRepo.getFitStepsOuts(fitOutId: fitOut.id!));
    } catch (e) {
      errorFitOutSteps.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get fit Out steps : $e ==========');
    } finally {
      loadingFitOutSteps.value = false;
    }
  }

  String getFitOutStepStatus({required int statusNo}) {
    if (statusNo == StatusNo.fitOutStepCompleted) {
      return StatusString.fitOutStepCompleted;
    } else if (statusNo == StatusNo.fitOutStepFurtherRequirementSubmitted) {
      return StatusString.fitOutStepFurtherRequirementSubmitted;
    } else if (statusNo == StatusNo.fitOutStepPending) {
      return StatusString.fitOutStepPending;
    } else if (statusNo == StatusNo.fitOutStepVerified) {
      return StatusString.fitOutStepVerified;
    } else if (statusNo == StatusNo.fitOutStepSkipped) {
      return StatusString.fitOutStepSkipped;
    } else {
      return Strings.na;
    }
  }
}

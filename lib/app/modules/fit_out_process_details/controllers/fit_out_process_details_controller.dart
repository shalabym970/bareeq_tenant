import 'package:bareeq/app/models/fit_out_model.dart';
import 'package:bareeq/app/models/fit_out_step_model.dart';
import 'package:bareeq/app/repositories/fit_out_repo.dart';
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/message.dart';
import '../../../repositories/messages_repo.dart';
import '../../../services/check_internet_connection_service.dart';

class FitOutProcessDetailsController extends GetxController {
  final errorMessages = false.obs;
  final errorFitOutSteps = false.obs;
  final loadingMessages = false.obs;
  final loadingFitOutSteps = false.obs;
  final messages = <MessageModel>[].obs;
  final fitOutSteps = <FitOutStepModel>[].obs;
  final connectionController = Get.find<InternetConnectionController>();

  FitOutModel fitOut = Get.arguments;

  final messagesRepo = MessagesRepo();
  final fitOutRepo = FitOutRepo();

  @override
  void onInit() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      getMessages();
      getFitOutSteps();
      super.onInit();
    }
  }

  @override
  onClose() {
    Get.log('========== FitOutProcessDetailsController is closed =========');
    Get.delete<FitOutProcessDetailsController>();
  }

  getMessages() async {
    try {
      errorMessages.value = false;
      loadingMessages.value = true;
      messages.assignAll(
          await messagesRepo.getMessagesForRecord(regardingId: fitOut.id!));
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
}

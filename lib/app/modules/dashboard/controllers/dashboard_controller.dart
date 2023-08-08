import 'package:Seef/app/models/fit_out_model.dart';
import 'package:Seef/app/models/work_permit.dart';
import 'package:Seef/app/repositories/fit_out_repo.dart';
import 'package:Seef/app/repositories/work_permit_repo.dart';
import 'package:Seef/app/services/session_services.dart';
import 'package:Seef/common/status_no.dart';
import 'package:Seef/common/status_string.dart';
import 'package:Seef/common/strings/error_strings.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/case_model.dart';
import '../../../models/contact_model.dart';
import '../../../models/invoice.dart';
import '../../../repositories/cases_repo.dart';
import '../../../repositories/invoices_repo.dart';

class DashboardController extends GetxController {
  final loadingWorkPermits = false.obs;
  final loadingCases = false.obs;
  final loadingInvoices = false.obs;
  final loadingLeases = false.obs;
  final loadingOutProcess = false.obs;
  final errorWorkPermits = false.obs;
  final errorCases = false.obs;
  final errorInvoices = false.obs;
  final errorLeases = false.obs;
  final errorOutProcess = false.obs;
  final workPermits = <WorkPermit>[].obs;
  final fitOuts = <FitOutModel>[].obs;
  final invoices = <Invoice>[].obs;
  final cases = <Case>[].obs;
  InvoicesRepository invoicesRepository = InvoicesRepository();
  WorkPermitRepo workPermitRepo = WorkPermitRepo();
  CasesRepository casesRepository = CasesRepository();
  FitOutRepo fitOutRepo = FitOutRepo();

  Contact get currentUser {
    return Get.find<SessionServices>().currentUser.value;
  }

  @override
  void onInit() {
    getWorkPermits();
    getInvoices();
    getCases();
    getFitOuts();
    super.onInit();
  }

  void getInvoices() async {
    try {
      errorInvoices.value = false;
      loadingInvoices.value = true;
      invoices.assignAll(await invoicesRepository.getInvoices());
    } catch (e) {
      errorInvoices.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get invoices : $e ==========');
    } finally {
      loadingInvoices.value = false;
    }
  }

  void getCases() async {
    try {
      errorCases.value = false;
      loadingCases.value = true;
      cases.assignAll(await casesRepository.getCases());
    } catch (e) {
      errorCases.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get Cases : $e ==========');
    } finally {
      loadingCases.value = false;
    }
  }

  void getWorkPermits() async {
    try {
      errorWorkPermits.value = false;
      loadingWorkPermits.value = true;
      workPermits.assignAll(await workPermitRepo.getWorkPermits());
    } catch (e) {
      errorWorkPermits.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get work permits : $e ==========');
    } finally {
      loadingWorkPermits.value = false;
    }
  }

  void getFitOuts() async {
    try {
      errorOutProcess.value = false;
      loadingOutProcess.value = true;
      fitOuts.assignAll(await fitOutRepo.getFitOuts());
    } catch (e) {
      errorOutProcess.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get fit outs process : $e ==========');
    } finally {
      loadingOutProcess.value = false;
    }
  }

  String getFitOutStatus({required int statusNo}) {
    if (statusNo == StatusNo.fitOutNotStarted) {
      return StatusString.fitOutNotStarted;
    } else if (statusNo == StatusNo.fitOutRejected) {
      return StatusString.fitOutRejected;
    } else if (statusNo == StatusNo.fitOutInProgress) {
      return StatusString.fitOutInProgress;
    } else if (statusNo == StatusNo.fitOutFurtherRequirementSubmitted) {
      return StatusString.fitOutFurtherRequirementSubmitted;
    } else if (statusNo == StatusNo.fitOutCompleted) {
      return StatusString.fitOutCompleted;
    } else {
      return StatusString.fitOutApproved;
    }
  }
}

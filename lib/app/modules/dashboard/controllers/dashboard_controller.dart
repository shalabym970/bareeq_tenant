import 'package:Seef/app/models/work_permit.dart';
import 'package:Seef/app/repositories/work_permit_repo.dart';
import 'package:Seef/app/services/session_services.dart';
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
  final invoices = <Invoice>[].obs;
  final cases = <Case>[].obs;
  InvoicesRepository invoicesRepository = InvoicesRepository();
  WorkPermitRepo workPermitRepo = WorkPermitRepo();
  CasesRepository casesRepository = CasesRepository();

  Contact get currentUser {
    return Get.find<SessionServices>().currentUser.value;
  }

  @override
  void onInit() {
    getInvoices();
    getCases();
    getWorkPermits();
    super.onInit();
  }

  void getInvoices() async {
    try {
      loadingInvoices.value = true;
      invoices.assignAll(await invoicesRepository.getInvoices());

      Get.log(
          '=========== invoices list : ${invoices.first.invoiceId} ==========');
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
      loadingCases.value = true;
      cases.assignAll(await casesRepository.getCases());

      Get.log('=========== Cases list : ${cases.first.id} ==========');
    } catch (e) {
      errorInvoices.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get Cases : $e ==========');
    } finally {
      loadingCases.value = false;
    }
  }

  void getWorkPermits() async {
    try {
      loadingWorkPermits.value = true;
      workPermits.assignAll(await workPermitRepo.getWorkPermits());

      Get.log('=========== Cases list : ${cases.first.id} ==========');
    } catch (e) {
      errorWorkPermits.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get Cases : $e ==========');
    } finally {
      loadingWorkPermits.value = false;
    }
  }
}

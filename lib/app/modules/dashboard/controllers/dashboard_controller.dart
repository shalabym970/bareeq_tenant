import 'package:bareeq/app/models/fit_out_model.dart';
import 'package:bareeq/app/models/leased_property.dart';
import 'package:bareeq/app/models/work_permit.dart';
import 'package:bareeq/app/repositories/fit_out_repo.dart';
import 'package:bareeq/app/repositories/lease_repo.dart';
import 'package:bareeq/app/repositories/work_permit_repo.dart';
import 'package:bareeq/app/services/session_services.dart';
import 'package:bareeq/common/strings/error_strings.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/ui.dart';
import '../../../models/case_model.dart';
import '../../../models/contact_model.dart';
import '../../../models/invoice.dart';
import '../../../repositories/cases_repo.dart';
import '../../../repositories/invoices_repo.dart';
import '../../../services/check_internet_connection_service.dart';
import '../../../services/streaming_services.dart';

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
  final leases = <LeasedProperty>[].obs;
  final invoicesRepo = InvoicesRepo();
  final workPermitRepo = WorkPermitRepo();
  final casesRepo = CasesRepo();
  final fitOutRepo = FitOutRepo();
  final leasesRepo = PropertiesRepo();
  final connectionController = Get.find<InternetConnectionController>();
  final  streamingService = StreamingService();

  Contact get currentUser {
    return Get.find<SessionServices>().currentUser.value;
  }

  @override
  void onInit() {
    Get.log(
        ' ============ current user : ${currentUser.accountCustomerId} ========== ');
    getWorkPermits();
    getInvoices();
    getCases();
    getFitOuts();
    getLeases();
    super.onInit();
  }

  void getInvoices() async {
    try {
      errorInvoices.value = false;
      loadingInvoices.value = true;
      invoices.assignAll(await invoicesRepo.getInvoices());
    } catch (e) {
      errorInvoices.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get invoices : $e ==========');
    } finally {
      loadingInvoices.value = false;
    }
  }

  getCases() async {
    try {
      errorCases.value = false;
      loadingCases.value = true;
      cases.assignAll(await casesRepo.getCases());
    } catch (e) {
      errorCases.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get Cases : $e ==========');
    } finally {
      loadingCases.value = false;
    }
  }

  getWorkPermits() async {
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
      Get.log('========== Error when get fit out process : $e ==========');
    } finally {
      loadingOutProcess.value = false;
    }
  }

  void getLeases() async {
    try {
      errorLeases.value = false;
      loadingLeases.value = true;
      leases.assignAll(await leasesRepo.getLeasedProperties());
    } catch (e) {
      errorLeases.value = true;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.publicErrorMessage));
      Get.log('========== Error when get Leases : $e ==========');
    } finally {
      loadingLeases.value = false;
    }
  }
}

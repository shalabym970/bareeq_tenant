import 'package:Seef/app/modules/cases/views/cases_view.dart';
import 'package:Seef/app/modules/work_permits/views/work_permits_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/case_details/bindings/case_details_binding.dart';
import '../modules/case_details/views/case_details_view.dart';
import '../modules/cases/bindings/cases_binding.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/fit_out_process_details/bindings/fit_out_process_details_binding.dart';
import '../modules/fit_out_process_details/views/fit_out_process_details_view.dart';
import '../modules/fit_outs/bindings/fit_outs_binding.dart';
import '../modules/fit_outs/views/fit_outs_view.dart';
import '../modules/invoice_details/bindings/invoice_details_binding.dart';
import '../modules/invoice_details/views/invoice_details_view.dart';
import '../modules/invoices/bindings/invoices_binding.dart';
import '../modules/invoices/views/invoices_view.dart';
import '../modules/lease_details/bindings/lease_details_binding.dart';
import '../modules/lease_details/views/lease_details_view.dart';
import '../modules/leases/bindings/leases_binding.dart';
import '../modules/leases/views/leases_view.dart';
import '../modules/messages/bindings/messages_binding.dart';
import '../modules/messages/views/messages_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/add_contact_view.dart';
import '../modules/profile/views/change_password_view.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/work_permit_details/bindings/work_permit_details_binding.dart';
import '../modules/work_permit_details/views/work_permit_details_view.dart';
import '../modules/work_permits/bindings/work_permits_binding.dart';
import 'app_routes.dart';

class ThemeAppPages {
  static String initial = Routes.login;

  static final routes = [
    GetPage(
        name: Routes.login,
        page: () => const LoginView(),
        binding: AuthBinding(),
        transition: Transition.zoom),
    GetPage(
        name: Routes.dashboard,
        page: () => const DashboardView(),
        binding: DashboardBinding()),
    GetPage(
        name: Routes.workPermitDetails,
        page: () => const WorkPermitDetailsView(),
        binding: WorkPermitDetailsBinding()),
    GetPage(
        name: Routes.caseDetails,
        page: () => const CaseDetailsView(),
        binding: CaseDetailsBinding()),
    GetPage(
        name: Routes.invoiceDetails,
        page: () => const InvoiceDetailsView(),
        binding: InvoiceDetailsBinding()),
    GetPage(
        name: Routes.leaseDetails,
        page: () => const LeaseDetailsView(),
        binding: LeaseDetailsBinding()),
    GetPage(
        name: Routes.fitOutDetails,
        page: () => const FitOutProcessDetailsView(),
        binding: FitOutProcessDetailsBinding()),
    GetPage(
        name: Routes.messages,
        page: () => const MessagesView(),
        binding: MessagesBinding()),
    GetPage(
        name: Routes.profile,
        page: () => const ProfileView(),
        binding: ProfileBinding()),
    GetPage(
        name: Routes.addNewContact,
        page: () => const AddContactView(),
        binding: ProfileBinding()),
    GetPage(
        name: Routes.changePassword,
        page: () => const ChangePasswordView(),
        binding: ProfileBinding()),
    GetPage(
        name: Routes.workPermits,
        page: () => const WorkPermitsView(),
        binding: WorkPermitsBinding()),
    GetPage(
        name: Routes.cases,
        page: () => const CasesView(),
        binding: CasesBinding()),
    GetPage(
        name: Routes.fitOuts,
        page: () => const FitOutsView(),
        binding: FitOutsBinding()),
    GetPage(
        name: Routes.invoices,
        page: () => const InvoicesView(),
        binding: InvoicesBinding()),
    GetPage(
        name: Routes.leases,
        page: () => const LeasesView(),
        binding: LeasesBinding()),
  ];
}

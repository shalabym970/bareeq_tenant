import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:property_pro/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:property_pro/app/modules/dashboard/views/dashboard_view.dart';
import 'package:property_pro/app/modules/fit_out_process_details/views/fit_out_process_details_view.dart';
import 'package:property_pro/app/modules/lease_details/views/lease_details_view.dart';
import 'package:property_pro/app/modules/work_permit_details/bindings/work_permit_details_binding.dart';
import 'package:property_pro/app/modules/work_permit_details/views/work_permit_details_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/case_details/bindings/case_details_binding.dart';
import '../modules/case_details/views/case_details_view.dart';
import '../modules/fit_out_process_details/bindings/fit_out_process_details_binding.dart';
import '../modules/invoice_details/bindings/invoice_details_binding.dart';
import '../modules/invoice_details/views/invoice_details_view.dart';
import '../modules/lease_details/bindings/lease_details_binding.dart';
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
  ];
}

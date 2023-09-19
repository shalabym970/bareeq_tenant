import 'package:bareeq/app/modules/cases/views/cases_view.dart';
import 'package:bareeq/app/modules/contacts/bindings/contacts_binding.dart';
import 'package:bareeq/app/modules/create_work_permit_item/views/create_work_permit_item_view.dart';
import 'package:bareeq/app/modules/change_password/bindings/change_password_binding.dart';
import 'package:bareeq/app/modules/work_permits/views/work_permits_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import '../middleware/auth_middleware.dart';
import '../modules/activity_details/bindings/activity_details_binding.dart';
import '../modules/activity_details/views/activity_details_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/auth/views/recover_account_view.dart';
import '../modules/case_details/bindings/case_details_binding.dart';
import '../modules/case_details/views/case_details_view.dart';
import '../modules/cases/bindings/cases_binding.dart';
import '../modules/contacts/views/contacts_view.dart';
import '../modules/create_case/bindings/add_case_binding.dart';
import '../modules/create_case/views/add_case_view.dart';
import '../modules/create_contact/bindings/add_contact_binding.dart';
import '../modules/create_contact/views/add_contact_view.dart';
import '../modules/create_contractor/bindings/add_contractor_binding.dart';
import '../modules/create_contractor/views/add_contractor_view.dart';
import '../modules/create_work_permit/bindings/add_work_permit_binding.dart';
import '../modules/create_work_permit/views/add_work_permit_view.dart';
import '../modules/create_work_permit_item/bindings/create_work_permit_item_binding.dart';
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
import '../modules/leased_property_details/bindings/leased_property_details_binding.dart';
import '../modules/leased_property_details/views/leased_property_details_view.dart';
import '../modules/messages/bindings/message_details_binding.dart';
import '../modules/messages/bindings/messages_binding.dart';
import '../modules/messages/views/message_details_view.dart';
import '../modules/messages/views/messages_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/properties/bindings/properties_binding.dart';
import '../modules/properties/views/properties_view.dart';
import '../modules/sold_property_details/bindings/sold_property_details_binding.dart';
import '../modules/sold_property_details/views/sold_property_details_view.dart';
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
        middlewares: [AuthMiddleware()],
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
        name: Routes.passwordRecovering,
        page: () => const RecoverAccountView(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.leasedPropertyDetails,
        page: () => const LeasedPropertyDetailsView(),
        binding: LeasedPropertyDetailsBinding()),
    GetPage(
        name: Routes.soldPropertyDetails,
        page: () => const SoldPropertyDetailsView(),
        binding: SoldPropertyDetailsBinding()),
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
        name: Routes.contacts,
        page: () => const ContactsView(),
        binding: ContactsBinding()),
    GetPage(
        name: Routes.addNewContact,
        page: () => const AddContactView(),
        binding: AddContactBinding()),
    GetPage(
        name: Routes.changePassword,
        page: () => const ChangePasswordView(),
        binding: ChangePasswordBinding()),
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
        name: Routes.properties,
        page: () => const PropertiesView(),
        binding: PropertiesBinding()),
    GetPage(
        name: Routes.activity,
        page: () => const ActivityDetailsView(),
        binding: ActivityDetailsBinding()),
    GetPage(
        name: Routes.addWorkPermit,
        page: () => const AddWorkPermitView(),
        binding: AddWorkPermitBinding()),
    GetPage(
        name: Routes.addContractor,
        page: () => const AddContractorView(),
        binding: AddContractorBinding()),
    GetPage(
        name: Routes.addCase,
        page: () => const AddCaseView(),
        binding: AddCaseBinding()),
    GetPage(
        name: Routes.messagesDetails,
        page: () => const MessageDetailsView(),
        binding: MessageDetailsBinding()),
    GetPage(
        name: Routes.createWorkPermitItem,
        page: () => const CreateWorkPermitItemView(),
        binding: CreateWorkPermitItemBinding()),
  ];
}
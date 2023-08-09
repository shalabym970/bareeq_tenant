import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../routes/app_routes.dart';
import '../../dashboard/controllers/dashboard_controller.dart';
import '../controllers/invoices_controller.dart';
import '../widgets/invoices_list/invoices_list_widget.dart';
import '../widgets/invoices_search_widget.dart';

class InvoicesView extends GetView<InvoicesController> {
  const InvoicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Get.offAllNamed(Routes.dashboard);
          return true;
        },
        child: RefreshIndicator(
          color: ColorManager.green,
          onRefresh: () async {
            Get.find<DashboardController>().getInvoices();
          },
          child: Scaffold(
            appBar: customAppBar(title: Strings.invoices),

            body: Padding(
                padding: EdgeInsets.only(right: 10.w, left: 10.w),
                child: const SingleChildScrollView(
                    primary: false,
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InvoicesSearchWidget(),
                          InvoicesListWidget()
                        ]))),

            drawer:
                customDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
          ),
        ));
  }
}

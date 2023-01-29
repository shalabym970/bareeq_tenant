import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:property_pro/app/modules/dashboard/controllers/dashboard_controller.dart';

import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../widgets/recent_cases/recent_cases_widget.dart';
import '../widgets/recent_fit_out_processes/recent_fit_out_processes_widget.dart';
import '../widgets/recent_invoices/recent_invoices_widget.dart';
import '../widgets/recent_leases/recent_leases_widget.dart';
import '../widgets/recent_work_permits/recent_work_permits_widget.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: Strings.dashboard),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: RichText(
                  text: const TextSpan(
                    text: Strings.welcome,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xff00345B)),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Shalaby',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const RecentWorkPermitWidget(),
              const RecentCasesWidget(),
              const RecentInvoicesWidget(),
              const RecentLeasesWidget(),
              const RecentFitOutProcessesWidget()
            ],
          ),
        ),
      ),

      drawer:
          CustomDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
    );

  }
}

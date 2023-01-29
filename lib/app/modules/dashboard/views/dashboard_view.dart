import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:property_pro/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:property_pro/common/color_manager.dart';

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
        padding: EdgeInsets.only(top: 20.h, right: 10.w, left: 10.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: RichText(
                  text: TextSpan(
                    text: Strings.welcome,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: ColorManager.darkBlue),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Shalaby',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            color: ColorManager.black),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
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

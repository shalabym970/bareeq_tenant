import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../routes/app_routes.dart';
import '../../dashboard/controllers/dashboard_controller.dart';
import '../controllers/cases_controller.dart';
import '../widgets/cases_list/cases_list_widget.dart';
import '../widgets/cases_search_widget.dart';

class CasesView extends GetView<CasesController> {
  const CasesView({super.key});

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
            Get.find<DashboardController>().getCases();
          },
          child: Scaffold(
            appBar: customAppBar(title: Strings.cases),

            body: Padding(
              padding: EdgeInsets.only(right: 10.w, left: 10.w),
              child: const SingleChildScrollView(
                  primary: false,
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [CasesSearchWidget(), CasesListWidget()])),
            ),
            drawer:
                customDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
          ),
        ));
  }
}

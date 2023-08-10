import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../routes/app_routes.dart';
import '../../dashboard/controllers/dashboard_controller.dart';
import '../controllers/fit_outs_controller.dart';
import '../widgets/fit_outs_list/fit_outs_list_widget.dart';

class FitOutsView extends GetView<FitOutsController> {
  const FitOutsView({super.key});

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
            Get.find<DashboardController>().getFitOuts();
          },
          child: Scaffold(
            appBar: customAppBar(title: Strings.fitOutProcesses),

            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
              child: SingleChildScrollView(
                  primary: false,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          hint: Strings.search,
                          controller: controller.searchController,
                          height: 55.h,
                          width: 1.sw,
                        ),
                        SizedBox(height: 10.h),
                        const FitOutsListWidget()
                      ])),
            ),
            drawer:
                customDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
          ),
        ));
  }
}

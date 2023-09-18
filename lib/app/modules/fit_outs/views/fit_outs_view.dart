import 'package:bareeq/app/models/fit_out_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_drawer.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../../common/widgets/empty_list_widget.dart';
import '../../../routes/app_routes.dart';
import '../../dashboard/controllers/dashboard_controller.dart';
import '../../dashboard/widgets/recent_fit_out_processes/fit_out_processes_list_item.dart';
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
            color: ColorManager.mainColor,
            onRefresh: () async {
              Get.find<DashboardController>().getFitOuts();
            },
            child: GestureDetector(
                onTap: () {
                  controller.focusNode.unfocus();
                },
                child: Scaffold(
                  appBar: customAppBar(title: Strings.fitOutProcesses),

                  body: Padding(
                      padding:
                          EdgeInsets.only(right: 10.w, left: 10.w, top: 20.h),
                      child: SingleChildScrollView(
                        primary: false,
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Obx(() => Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextField(
                                    hint: Strings.search,
                                    controller: controller.searchController,
                                    height: 50.h,
                                    width: 1.sw,
                                    focusNode: controller.focusNode,
                                    onChanged: (value) {
                                      controller.onChangeSearching(
                                          searchString: value);
                                    },
                                    suffixIcon: controller.isSearching.isTrue
                                        ? GestureDetector(
                                            onTap: () {
                                              controller.stopSearch();
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color: ColorManager.black,
                                              size: 25.sp,
                                            ),
                                          )
                                        : null,
                                  ),
                                  SizedBox(height: 10.h),
                                  controller.isSearching.isTrue
                                      ? controller.searchingList.isEmpty
                                          ? Padding(
                                              padding:
                                                  EdgeInsets.only(top: 0.3.sh),
                                              child: const EmptyListWidget(
                                                  message:
                                                      Strings.noSearchResult))
                                          : ListView.builder(
                                              padding: EdgeInsets.only(
                                                  bottom: 10.h, top: 10.h),
                                              primary: false,
                                              shrinkWrap: true,
                                              itemCount: controller
                                                  .searchingList.length,
                                              itemBuilder: ((_, index) {
                                                FitOutModel fitOut = controller
                                                    .searchingList
                                                    .elementAt(index);
                                                return FitOutProcessesListItem(
                                                  fitOut: fitOut,
                                                );
                                              }))
                                      : const FitOutsListWidget()
                                ])),
                      )),
                  drawer:
                      customDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
                ))));
  }
}

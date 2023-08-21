import 'package:Bareeq/app/models/work_permit.dart';
import 'package:Bareeq/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:Bareeq/app/modules/dashboard/widgets/recent_work_permits/work_permits_item.dart';
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
import '../controllers/work_permits_controller.dart';
import '../widgets/work_permits_list/work_permits_list_widget.dart';

class WorkPermitsView extends GetView<WorkPermitsController> {
  const WorkPermitsView({super.key});

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
              Get.find<DashboardController>().getWorkPermits();
            },
            child: GestureDetector(
                onTap: () {
                  controller.focusNode.unfocus();
                },
                child: Scaffold(
                    appBar: customAppBar(title: Strings.workPermits),
                    body: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 20.h),
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
                                              child: EmptyListWidget(
                                                  fontSize: 17.sp,
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
                                                WorkPermitModel workPermit =
                                                    controller.searchingList
                                                        .elementAt(index);
                                                return WorkPermitItem(
                                                    workPermit: workPermit);
                                              }))
                                      : const WorkPermitsListWidget()
                                ])),
                      ),
                    ),
                    drawer:
                        customDrawer() // This trailing comma makes auto-formatting nicer for build methods.
                    ))));
  }
}

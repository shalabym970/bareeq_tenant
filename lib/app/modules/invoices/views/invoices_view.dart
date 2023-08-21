import 'package:Bareeq/app/models/invoice.dart';
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
import '../../dashboard/widgets/recent_invoices/invoices_list_item.dart';
import '../controllers/invoices_controller.dart';
import '../widgets/invoices_list/invoices_list_widget.dart';

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
            color: ColorManager.mainColor,
            onRefresh: () async {
              Get.find<DashboardController>().getInvoices();
            },
            child: GestureDetector(
                onTap: () {
                  controller.focusNode.unfocus();
                },
                child: Scaffold(
                    appBar: customAppBar(title: Strings.invoices),
                    body: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 20.h),
                        child: SingleChildScrollView(
                            primary: false,
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Obx(() => Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        suffixIcon:
                                            controller.isSearching.isTrue
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
                                                  padding: EdgeInsets.only(
                                                      top: 0.3.sh),
                                                  child: EmptyListWidget(
                                                      fontSize: 17.sp,
                                                      message: Strings
                                                          .noSearchResult))
                                              : ListView.builder(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10.h, top: 10.h),
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  itemCount: controller
                                                      .searchingList.length,
                                                  itemBuilder: ((_, index) {
                                                    Invoice invoice = controller
                                                        .searchingList
                                                        .elementAt(index);
                                                    return InvoicesListItem(
                                                        invoice: invoice);
                                                  }))
                                          : const InvoicesListWidget()
                                    ])))),
                    drawer:
                        customDrawer() // This trailing comma makes auto-formatting nicer for build methods.
                    ))));
  }
}

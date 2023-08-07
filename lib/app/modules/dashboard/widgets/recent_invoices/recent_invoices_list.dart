import 'package:Seef/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:Seef/app/modules/dashboard/widgets/recent_invoices/recent_invoices_list_item.dart';
import 'package:Seef/common/strings/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/dashboard_shimmer.dart';
import '../../../../../common/widgets/empty_list_widget.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../../../models/invoice.dart';

class RecentInvoicesList extends GetView<DashboardController> {
  const RecentInvoicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Obx(
          () => controller.errorInvoices.isTrue
              ? CustomErrorWidget(
                  iconWidth: 20.w,
                  iconHeight: 20.h,
                  fontSize: 15.sp,
                )
              : controller.loadingInvoices.isTrue
                  ? Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: ShimmerWidget.rectangular(height: 100.h),
          )
                  : controller.invoices.isEmpty
                      ? EmptyListWidget(
                          fontSize: 15.sp, message: Strings.invoicesEmpty)
                      : ListView.builder(
                          padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: controller.invoices.length > 2
                              ? 2
                              : controller.invoices.length,
                          itemBuilder: ((_, index) {
                            Invoice invoice =
                                controller.invoices.elementAt(index);

                            return RecentInvoicesListItem(invoice: invoice);
                          }),
                        ),
        ));
  }
}

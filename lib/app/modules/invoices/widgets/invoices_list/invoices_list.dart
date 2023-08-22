import 'package:Bareeq/app/modules/dashboard/widgets/recent_invoices/invoices_list_item.dart';
import 'package:Bareeq/common/widgets/vertical_list_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../../common/widgets/empty_list_widget.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../../../models/invoice.dart';
import '../../../dashboard/controllers/dashboard_controller.dart';

class InvoicesList extends GetView<DashboardController> {
  const InvoicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Obx(
          () => controller.loadingInvoices.isTrue
              ? VerticalListLoading(height: 100.h)
              : controller.errorInvoices.isTrue
                  ? CustomErrorWidget(
                      iconWidth: 20.w,
                      iconHeight: 20.h,
                      fontSize: 15.sp,
                    )
                  : controller.invoices.isEmpty
                      ? const EmptyListWidget(message: Strings.invoicesEmpty)
                      : ListView.builder(
                          padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: controller.invoices.length,
                          itemBuilder: ((_, index) {
                            Invoice invoice =
                                controller.invoices.elementAt(index);
                            return InvoicesListItem(invoice: invoice);
                          }),
                        ),
        ));
  }
}

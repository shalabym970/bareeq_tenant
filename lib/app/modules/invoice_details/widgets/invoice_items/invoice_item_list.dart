import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../../common/widgets/dashboard_shimmer.dart';
import '../../../../../common/widgets/empty_list_widget.dart';
import '../../../../../common/widgets/error_widget.dart';
import '../../../../models/invoice_item.dart';
import '../../controllers/invoice_details_controller.dart';
import 'invoice_items_list_item.dart';

class InvoiceItemsList extends GetView<InvoiceDetailsController> {
  const InvoiceItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Obx(() => controller.loadingInvoiceItems.isTrue
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: ShimmerWidget.rectangular(height: 100.h))
            : controller.errorInvoiceItems.isTrue
                ? CustomErrorWidget(iconWidth: 20.w, iconHeight: 20.h)
                : controller.invoiceItems.isEmpty
                    ? const Center(
                        child: EmptyListWidget(
                            message: Strings.nothingInvoiceItems))
                    : ListView.builder(
                        padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                        primary: false,
                        shrinkWrap: true,
                        itemCount: controller.invoiceItems.length,
                        itemBuilder: ((_, index) {
                          InvoiceItem invoiceItem =
                              controller.invoiceItems.elementAt(index);
                          return InvoiceItemsListItem(invoiceItem: invoiceItem);
                        }))));
  }
}
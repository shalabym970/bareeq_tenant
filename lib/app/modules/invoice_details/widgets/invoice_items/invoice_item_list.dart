import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../models/invoice_details.dart';
import '../../controllers/invoice_details_controller.dart';
import 'invoice_items_list_item.dart';


class InvoiceItemsList extends GetView<InvoiceDetailsController> {
  const InvoiceItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.h),
      child: ListView.builder(
        padding:  EdgeInsets.only(bottom: 10.h, top: 10.h),
        primary: false,
        shrinkWrap: true,
        itemCount:  controller.invoiceItems.length,
        itemBuilder: ((_, index) {
          InvoiceDetails invoiceItem =
          controller.invoiceItems.elementAt(index);
          return InvoiceItemsListItem(invoiceItem: invoiceItem);
        }),
      ),
    );
  }
}

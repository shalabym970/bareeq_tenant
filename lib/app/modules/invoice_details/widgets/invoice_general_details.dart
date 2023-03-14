import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/images_paths.dart';
import '../../../../common/strings/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';
import '../controllers/invoice_details_controller.dart';
import 'package:intl/intl.dart' as intl;

class InvoiceGeneralDetailsWidget extends GetView<InvoiceDetailsController> {
  const InvoiceGeneralDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.generalDetails,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customDetailsItem(
                        icon: ImagePaths.path79,
                        title: Strings.invoiceNumber,
                        value: controller.invoice.invoiceNumber!),
                    SizedBox(
                      height: 20.h,
                    ),
                    customDetailsItem(
                        icon: ImagePaths.filingTime,
                        title: Strings.submitDate,
                        value: intl.DateFormat('EEE d MMM y')
                            .format(controller.invoice.createdOn!)
                            .toString())
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customDetailsItem(
                        icon: ImagePaths.deleteCalendar,
                        title: Strings.amount,
                        value:
                            controller.invoice.amountDueRemaining.toString()),
                    SizedBox(
                      height: 20.h,
                    ),
                    customDetailsItem(
                        icon: ImagePaths.filingTime,
                        title: Strings.endDate,
                        value: controller.invoice.deliveredDate != null
                            ? intl.DateFormat('EEE d MMM y')
                            .format(DateTime.parse(
                            controller.invoice.deliveredDate!))
                            .toString()
                            : controller.invoice.deliveredDate!)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

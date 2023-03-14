import 'package:Seef/app/models/invoice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import '../../../../../common/color_manager.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../routes/app_routes.dart';

class RecentInvoicesListItem extends StatelessWidget {
  const RecentInvoicesListItem({Key? key, required this.invoice})
      : super(key: key);
  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.invoiceDetails,arguments: invoice);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: GestureDetector(
            child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.h)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1.h,
                blurRadius: 3.h,
                offset: Offset(0, 3.h), // changes position of shadow
              ),
            ],
          ),
          height: 116.h,
          child: Card(
            color: ColorManager.textFieldBg,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(Strings.invoiceNumber,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                  color: ColorManager.green)),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(invoice.invoiceNumber ?? "null",
                              style: TextStyle(
                                  fontSize: 12.sp, color: ColorManager.black))
                        ],
                      ),
                      Column(
                        children: [
                          Text(Strings.dueDate,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp,
                                  color: ColorManager.green)),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                              intl.DateFormat('EEE d MMM y')
                                  .format(invoice.dueDate!)
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 12.sp, color: ColorManager.black))
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            Strings.regarding,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: ColorManager.green),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(invoice.name ?? "null",
                              style: TextStyle(
                                  fontSize: 12.sp, color: ColorManager.black))
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            Strings.amount,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: ColorManager.green),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(invoice.amountDueRemaining.toString(),
                              style: TextStyle(
                                  fontSize: 12.sp, color: ColorManager.black))
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(Strings.submitDate,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                              color: ColorManager.green)),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                          invoice.deliveredDate != null
                              ? intl.DateFormat('EEE d MMM y')
                                  .format(
                                      DateTime.parse(invoice.deliveredDate!))
                                  .toString()
                              : invoice.deliveredDate!,
                          style: TextStyle(
                              fontSize: 12.sp, color: ColorManager.black))
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}

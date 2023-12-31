import 'package:bareeq/app/models/invoice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import '../../../../../common/color_manager.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../routes/app_routes.dart';

class InvoicesListItem extends StatelessWidget {
  const InvoicesListItem({Key? key, required this.invoice}) : super(key: key);
  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.toNamed(Routes.invoiceDetails, arguments: invoice);
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
                              offset:
                                  Offset(0, 3.h) // changes position of shadow
                              )
                        ]),
                    height: 116.h,
                    child: Card(
                        color: ColorManager.textFieldBg,
                        child: Row(children: [
                          Expanded(
                              flex: 1,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text(Strings.invoiceNumber,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.sp,
                                                color: ColorManager.mainColor)),
                                        SizedBox(height: 3.h),
                                        Text(
                                            invoice.invoiceNumber ?? Strings.na,
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                color: ColorManager.black))
                                      ],
                                    ),
                                    Column(children: [
                                      Text(Strings.dueDate,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.sp,
                                              color: ColorManager.mainColor)),
                                      SizedBox(height: 3.h),
                                      Text(
                                          invoice.dueDate != null
                                              ? intl.DateFormat('EEE d MMM y')
                                                  .format(invoice.dueDate!)
                                                  .toString()
                                              : Strings.na,
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              color: ColorManager.black))
                                    ])
                                  ])),
                          Expanded(
                              flex: 1,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          Strings.regarding,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.sp,
                                              color: ColorManager.mainColor),
                                        ),
                                        SizedBox(height: 3.h),
                                        Text(invoice.name ?? Strings.na,
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                color: ColorManager.black))
                                      ],
                                    ),
                                    Column(children: [
                                      Text(
                                        Strings.amount,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                            color: ColorManager.mainColor),
                                      ),
                                      SizedBox(height: 3.h),
                                      Text(
                                          invoice.amountDueRemaining != null
                                              ? invoice.amountDueRemaining
                                                  .toString()
                                              : Strings.na,
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              color: ColorManager.black))
                                    ])
                                  ])),
                          Expanded(
                              flex: 1,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(Strings.submitDate,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                            color: ColorManager.mainColor)),
                                    SizedBox(height: 3.h),
                                    Text(
                                        invoice.createdOn != null
                                            ? intl.DateFormat('EEE d MMM y')
                                                .format(invoice.createdOn!)
                                                .toString()
                                            : Strings.na,
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: ColorManager.black))
                                  ]))
                        ]))))));
  }
}

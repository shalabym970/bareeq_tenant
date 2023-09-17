import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/color_manager.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../models/invoice_item.dart';
import '../../controllers/invoice_details_controller.dart';

class InvoiceItemsListItem extends GetView<InvoiceDetailsController> {
  const InvoiceItemsListItem({Key? key, required this.invoiceItem})
      : super(key: key);
  final InvoiceItem? invoiceItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                          offset: Offset(0, 3.h))
                    ]),
                height: 116.h,
                child: Card(
                    color: ColorManager.textFieldBg,
                    child: Row(children: [
                      Expanded(
                          flex: 1,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text(Strings.productName,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                            color: ColorManager.mainColor)),
                                    SizedBox(height: 3.h),
                                    Text(invoiceItem!.productName ?? Strings.na,
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: ColorManager.black))
                                  ],
                                ),
                                Column(children: [
                                  Text(Strings.discount,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.sp,
                                          color: ColorManager.mainColor)),
                                  SizedBox(height: 3.h),
                                  Text(
                                      '${controller.invoice.discountPercentage ?? Strings.na}%',
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          color: ColorManager.black))
                                ])
                              ])),
                      Expanded(
                          flex: 1,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(children: [
                                  Text(
                                    Strings.pricePerUnit,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp,
                                        color: ColorManager.mainColor),
                                  ),
                                  SizedBox(height: 3.h),
                                  Text(
                                      invoiceItem!.pricePerUnit != null
                                          ? invoiceItem!.pricePerUnit.toString()
                                          : Strings.na,
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          color: ColorManager.black))
                                ]),
                                Column(children: [
                                  Text(
                                    Strings.totalAmount,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp,
                                        color: ColorManager.mainColor),
                                  ),
                                  SizedBox(height: 3.h),
                                  Text(
                                      invoiceItem!.baseAmount != null
                                          ? invoiceItem!.baseAmount.toString()
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
                                Text(Strings.quantity,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp,
                                        color: ColorManager.mainColor)),
                                SizedBox(height: 3.h),
                                Text(
                                    invoiceItem!.quantity != null
                                        ? invoiceItem!.quantity.toString()
                                        : Strings.na,
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: ColorManager.black))
                              ]))
                    ])))));
  }
}

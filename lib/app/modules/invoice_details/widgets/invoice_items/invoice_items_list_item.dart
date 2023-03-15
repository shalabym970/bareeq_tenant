import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/color_manager.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../models/invoice_details.dart';
import '../../controllers/invoice_details_controller.dart';

class InvoiceItemsListItem extends GetView<InvoiceDetailsController> {
  const InvoiceItemsListItem({Key? key, required this.invoiceItem})
      : super(key: key);
  final InvoiceDetails? invoiceItem;

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
                        Text(Strings.productName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: ColorManager.green)),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(invoiceItem!.productName.toString(),
                            style: TextStyle(
                                fontSize: 12.sp, color: ColorManager.black))
                      ],
                    ),
                    Column(
                      children: [
                        Text(Strings.discount,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: ColorManager.green)),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text('${controller.invoice.discountPercentage}%',
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
                          Strings.pricePerUnit,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                              color: ColorManager.green),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(invoiceItem!.pricePerUnit.toString(),
                            style: TextStyle(
                                fontSize: 12.sp, color: ColorManager.black))
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          Strings.totalAmount,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                              color: ColorManager.green),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(invoiceItem!.baseAmount.toString(),
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
                    Text(Strings.quantity,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                            color: ColorManager.green)),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(invoiceItem!.quantity.toString(),
                        style: TextStyle(
                            fontSize: 12.sp, color: ColorManager.black))
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:property_pro/common/color_manager.dart';
import 'package:property_pro/common/images_paths.dart';

import '../../../../../common/strings.dart';
import 'invoice_item_list.dart';


class InvoiceItemsWidget extends StatelessWidget {
  const InvoiceItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(6.h),
                    child: SvgPicture.asset(ImagePaths.moneyNotes,
                        height: 20.h, width: 20.w),
                  ),
                   Padding(
                    padding: EdgeInsets.all(6.h),
                    child: Text(
                     Strings.invoiceItems,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 32.h,
                width: 32.w,
                child: FloatingActionButton(
                  onPressed: () {},
                  heroTag: null,
                  backgroundColor: ColorManager.primaryBTNColorBrown,
                  child:  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),
              )
            ],
          ),
          const InvoiceItemsList()
        ],
      ),
    );
  }
}

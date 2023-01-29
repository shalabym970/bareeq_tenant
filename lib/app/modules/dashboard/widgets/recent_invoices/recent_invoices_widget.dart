import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:property_pro/app/modules/dashboard/widgets/recent_invoices/recent_invoices_list.dart';
import 'package:property_pro/common/color_manager.dart';
import 'package:property_pro/common/images_paths.dart';

import '../../../../../common/strings.dart';


class RecentInvoicesWidget extends StatelessWidget {
  const RecentInvoicesWidget({Key? key}) : super(key: key);

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
                     Strings.recentInvoices,
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
          const RecentInvoicesList()
        ],
      ),
    );
  }
}

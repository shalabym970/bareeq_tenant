import 'package:bareeq/app/modules/dashboard/widgets/recent_invoices/recent_invoices_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../common/images_paths.dart';
import '../../../../../common/strings/strings.dart';
import '../../../../routes/app_routes.dart';

class RecentInvoicesWidget extends StatelessWidget {
  const RecentInvoicesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                Get.toNamed(Routes.invoices);
              },
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(6.h),
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
              )),
          const RecentInvoicesList()
        ],
      ),
    );
  }
}

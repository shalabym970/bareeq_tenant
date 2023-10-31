import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../common/images_paths.dart';
import '../../../../../common/strings/strings.dart';
import 'invoices_list.dart';

class InvoicesListWidget extends StatelessWidget {
  const InvoicesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(6.h),
                child: SvgPicture.asset(ImagePaths.moneyNotes,
                    height: 20.h, width: 20.w),
              ),
              Padding(
                padding: EdgeInsets.all(6.h),
                child: Text(
                  Strings.invoices,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          const InvoicesList()
        ],
      ),
    );
  }
}

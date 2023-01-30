import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_pro/common/images_paths.dart';

import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_details_item.dart';


class InvoiceGeneralDetailsWidget extends StatelessWidget {
  const InvoiceGeneralDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(10.h),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customDetailsItem(
                      icon: ImagePaths.path79,
                      title: Strings.invoiceNumber,
                      value: 'CS--21--001'),
                   SizedBox(
                    height: 20.h,
                  ),
                  customDetailsItem(
                      icon: ImagePaths.filingTime,
                      title: Strings.submitDate,
                      value: '15-November-2021')
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customDetailsItem(
                      icon: ImagePaths.deleteCalendar,
                      title: Strings.amount,
                      value: '250'),
                   SizedBox(
                    height: 20.h,
                  ),
                  customDetailsItem(
                      icon: ImagePaths.filingTime,
                      title: Strings.endDate,
                      value: '15-November-2021')
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
